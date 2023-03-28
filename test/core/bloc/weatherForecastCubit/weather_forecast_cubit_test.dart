
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';   
import 'package:weather_app/core/data/model/weather_forecast_model.dart'; 
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forecast_state.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forecast_cubit.dart';
import 'package:weather_app/core/data/model/weather_params.dart';
import 'package:weather_app/core/repository/weather_repository.dart';

import 'weather_forecast_cubit_test.mocks.dart'; 

//class MockWeatherRepository extends Mock implements  {}

@GenerateMocks([WeatherRepository])

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late WeatherForecastCubit forecastCubit;
  final params = WeatherParams(
                     longitude: -1.1634823,
                     latitude: 36.8252953,
                     key : "62429f7781c035b5d8f16a3fb43f6b85",
                    ); 
 

  //final WeatherInfoModel modelResponse =  WeatherInfoModel(main: Main(temp: 289.4, feelsLike: 289.43, tempMin: 289.4, tempMax: 289.43, pressure: 1015, humidity: 90, seaLevel: 1015, grndLevel: 831), weather:[Weather(id: 500, main: 'Rain', description: 'light rain', icon: '10n')]);
final WeatherForecastModel sampleWeather = WeatherForecastModel(city: City(id:1 ,name:'Kiambu',coord: Coord(lon: 36.8253, lat: -1.1635), country:'Kenya' ,population:233 ,timezone: 23423,sunrise:3 ,sunset:23), message:200 , cnt:0 , cod: '200', list: [ListElement(dt: 200,
                 weather:[Weather(id: 500, main: MainEnum.RAIN, description: 'light rain', icon: '10n')],
                 clouds: Clouds(all: 99),
                 main:MainClass(temp: 289.4, feelsLike: 289.43, tempMin: 289.4, tempMax: 289.43, pressure: 1015, humidity: 90,seaLevel:1015,grndLevel: 831),
                 wind: Wind(speed:1.8,deg: 57, gust: 5.29), 
                 visibility:10000,
                 rain: Rain(the3H: 0.34),
                 //sys: Sys(type: 1, id: 2543, country: 'KE', sunrise: 1679542568, sunset: 1679586158),
                 dtTxt: DateTime.now(),
                 pop: 34,
                 ), ] );
                 

  setUp(() => {

    mockWeatherRepository  = MockWeatherRepository(), 
    forecastCubit = WeatherForecastCubit(weatherRepository: mockWeatherRepository),

  });

  tearDown(() => {
   forecastCubit.close(),
  });

    test('Blog should have inital state as [CurrentLocationState]', () {
    expect(forecastCubit.state.runtimeType, const WeatherForecastInitState().runtimeType);
  });
  test('Test cubit [getStatements]', () => {
    when(forecastCubit.getStatements(params)).thenAnswer((_) async => sampleWeather),
    expect(forecastCubit.getStatements(params), completes),

  });
 


  blocTest("Test fetch data [getStatements]", 
  build: () =>forecastCubit,
  act: (WeatherForecastCubit cubit)
        { 
           when(mockWeatherRepository.getWeatherForecast(params.toJson())).thenAnswer((_) async => sampleWeather);
           cubit.getStatements(params);
        },
  expect: () => [isA<WeatherForecastLoadingState>(), isA<WeatherForecastSuccessState>()],
  verify: (_) {
    verify(mockWeatherRepository.getWeatherForecast(params.toJson())).called(1);
  },
  );

}