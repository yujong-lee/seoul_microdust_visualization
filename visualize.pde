int size = 14;
int dayMax = 31;
int hourMax = 23;
Table table = loadTable("data.csv", "header, csv");
float [][] micro = new float[dayMax+1][hourMax+1];


size(338, 436);
background(255);


stroke(200);
rect(0,0,337, 435);
noStroke();
translate(1,1);

for(int i = 0; i < table.getRowCount(); ++i) {;
  TableRow row = table.getRow(i);
  int day = row.getInt("day");
  int hour = row.getInt("hour");
  float data = row.getFloat("data");
    
  micro[day][hour] = data;
}
  
for(int day = 1; day < dayMax + 1; ++day) {
  for(int hour = 0; hour < hourMax + 1; ++hour) {
    float grayScale = 255 - micro[day][hour]*4;
    if(grayScale < 0) {
      grayScale = 0;
    }
    fill(grayScale);
    rect(size*hour, size*(day-1), size, size);
  }
}
