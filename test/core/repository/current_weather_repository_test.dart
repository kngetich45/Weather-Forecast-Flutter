
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart'; 
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart';
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

   group("Current weather test", () {  
    test('Test fetch current data', () async {
      final weather = WeatherInfoModel();
      when(weatherRepo.getCurrentLocationWeather(params.toJson())).thenAnswer((_) async {
        return weather;
      });

      final res = await weatherRepo.getCurrentLocationWeather(params.toJson());
      expect(res, isA<WeatherInfoModel>());
      expect(res, weather);

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