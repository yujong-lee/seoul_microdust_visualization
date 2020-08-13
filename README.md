# Seoul_Ultrafine dust_Visualization
Seoul Ultrafine-dust Visualization using Open data.

## Overview
This is simple visualization of Ultrafine-dust in Seoul. Data used for this project is measured through Smart Seoul City Data Sensor (S-DoT) installed in 850 locations in Seoul.
Ultrafine dust, fine dust, temperature, humidity, illumination, noise, vibration, ultraviolet light, wind speed, wind direction, etc is measured, but I focused on Ultrafine dust only. Dust data is measured using a simple measuring instrument (grade 2) so it does not indicate the accurate air pollution level. However, it's enough to identify changes over time and visualize.

## Process
I followed this steps.
1. Get raw data.CSV.
2. Remove unnecessary columns and rename id.
3. Rearrange data and write CSV file using perl script.
5. Check CSV file and append first row.
6. Processing reads final CSV and visualize it.
7. Done.

## Example
Visualization of April and May. 

<img src="https://github.com/yujong-lee/seoul_ultrafinedust_visualization/blob/master/4_result.png" width="30%"></img> 
April  /  May <img src="https://github.com/yujong-lee/seoul_ultrafinedust_visualization/blob/master/5_result.png" width="30%"></img> 

row -> date, column -> time. 

## Acknowledgments
This data is based on the Seoul IoT city data data, and the results are not related to the city.

본 자료는 [서울시 IoT도시데이터 자료](http://data.seoul.go.kr/dataList/OA-15969/S/1/datasetView.do#)를 활용한 것이며, 연구 결과는 서울시와 관련 없음을 밝힙니다.
