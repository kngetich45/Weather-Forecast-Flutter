
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart'; 
import 'package:weather_app/core/data/model/weather_info_model.dart';
import 'package:weather_app/core/data/model/weather_params.dart';  
import 'package:weather_app/core/repository/current_weather_repository.dart';

import 'current_weather_repository_test.mocks.dart';

 class CurrentWeatherRepositoryTest extends Mock implements CurrentWeatherRepository {}

@GenerateMocks([CurrentWeatherRepositoryTest])
Future<void> main() async{  
  late MockCurrentWeatherRepositoryTest weatherRepo;

  setUpAll(() {
     weatherRepo = MockCurrentWeatherRepositoryTest();
  }); 
   final params = WeatherParams(
                     longitude: -1.1634823,
                     latitude: 36.8252953,
                     key : "62429f7781c035b5d8f16a3fb43f6b85",
                    );
  final WeatherInfoModel modelResponse =  WeatherInfoModel(main: Main(temp: 28.4, feelsLike: 289.43, tempMin: 289.4, tempMax: 289.43, pressure: 1015, humidity: 90, seaLevel: 1015, grndLevel: 831), weather:[Weather(id: 500, main: 'Rain', description: 'light rain', icon: '10n')]);

   group("#getCurrentLocationWeather", () {  
    test('Verify fetch current weather info [getCurrentLocationWeather]', () async {
     
      when(weatherRepo.getCurrentLocationWeather(params.toJson())).thenAnswer((_) async {
        return modelResponse;
      });

      final res = await weatherRepo.getCurrentLocationWeather(params.toJson());
      expect(res, isA<WeatherInfoModel>());
      expect(res, modelResponse);
      verify(weatherRepo.getCurrentLocationWeather(params.toJson())).called(1);

    });

    test('Test fetch current weather throws Exceptions', () {
      when(weatherRepo.getCurrentLocationWeather(params.toJson())).thenAnswer((_) async {
        throw Exception();
      });
      final res = weatherRepo.getCurrentLocationWeather(params.toJson());
      expect(res, throwsException);
    });  
   });
 
}