import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/network/endpoints.dart';

void main() {
    
group('Test current endpoints', () { 
   test('Test Current Weather endpoints', () {
    String  getCurrentWeather = 'https://api.openweathermap.org/data/2.5/weather/'; 
    expect(EndPoints.getCurrentWeather.url, getCurrentWeather); 
  });

  test('Test  Weather Forecast url', () {
    String  getWeatherForecast = 'https://api.openweathermap.org/data/2.5/forecast';

    expect(EndPoints.getWeatherForecast.url, getWeatherForecast);

  });
});

 
  
}