use strict;
use warnings;
use Parse::CSV;
#https://metacpan.org/pod/Parse::CSV

sub sortNumber {
  my $arr_ref = shift; 
  my @sorted = sort {$a <=> $b} @$arr_ref;
  return \@sorted;
}

sub getMedian {
  my $arr_ref = shift; 
  my $sorted_ref = sortNumber($arr_ref);    
  my @sorted = @$sorted_ref;
  
  my $len = $#sorted + 1;       
  return undef if ($len == 0); 
  my $center = $len / 2;       
  if ($len % 2 == 1) { 
    return $sorted[$center]; 
  } else {
    return ($sorted[$center - 1] + $sorted[$center]) / 2; 
  }
}

sub date_parser {
	my $date_string = shift;
	my %hash;
	
	my @key = ('month', 'day', 'hour');
	my @value = ($date_string =~ /2020.(\d+).(\d+) (\d+):00/);
	
	@hash{@key} = @value;
	return \%hash;
}


my @micro = [];
my $month = 4;

my $parser = Parse::CSV->new(
    file       => "./ripped_data/month$month.csv",
    sep_char   => ',',
    names      => 1,
    filter     => sub { ($_->{micro} eq '0') ? undef : $_ },
);

while (my $row = $parser->fetch ) {
	my $date = date_parser($row->{date});
	
	if (($row->{micro} eq 'NA') || ($date->{month} != $month)) {
		next;
	}
	
	if(!defined $micro[$date->{day}]) {
		$micro[$date->{day}] = [];
	}
	
	if(!defined $micro[$date->{day}][$date->{hour}]) {
		$micro[$date->{day}][$date->{hour}] = [];
	}
	
	my $store_by_time_ref = $micro[$date->{day}][$date->{hour}];
	push(@$store_by_time_ref, $row->{micro});
}

print "day,hour,data\n";
for(my $day = 1; $day < 32; ++$day) {
	for(my $hour = 0; $hour < 24; ++$hour) {
		my $ref = $micro[$day][$hour];
		if(defined $ref) {
			my $data = getMedian(sortNumber($ref));
			print "$day,$hour,$data\n";
		}
	}
}
