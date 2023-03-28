 
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_cubit.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_state.dart'; 
import 'package:weather_app/core/data/model/weather_info_model.dart';
import 'package:weather_app/core/data/model/weather_params.dart'; 
import 'package:weather_app/core/repository/current_weather_repository.dart';

import 'current_weather_cubit_test.mocks.dart';
  
@GenerateMocks([CurrentWeatherRepository])

void main() {
  late MockCurrentWeatherRepository mockCurrentWeatherRepository;
  late CurrentWeatherCubit currentWeatherCubit;
   final params = WeatherParams(
                     longitude: -1.1634823,
                     latitude: 36.8252953,
                     key : "62429f7781c035b5d8f16a3fb43f6b85",
                    ); 

  final WeatherInfoModel modelResponse =  WeatherInfoModel(main: Main(temp: 289.4, feelsLike: 289.43, tempMin: 289.4, tempMax: 289.43, pressure: 1015, humidity: 90, seaLevel: 1015, grndLevel: 831), weather:[Weather(id: 500, main: 'Rain', description: 'light rain', icon: '10n')]);
   
  setUp(() => {
    mockCurrentWeatherRepository = MockCurrentWeatherRepository(),
    currentWeatherCubit = CurrentWeatherCubit(currentWeatherRepository: mockCurrentWeatherRepository), 
  });
 

  tearDown(() => {
    currentWeatherCubit.close() ,
  });

  test('cubit should have inital state as [CurrentLocationState]', () {
    expect(currentWeatherCubit.state.runtimeType, const CurrentWeatherInitState().runtimeType);
  });
  

  test('cubit should complete as at [getStatements]', () => {
    when(mockCurrentWeatherRepository.getCurrentLocationWeather(params.toJson())).thenAnswer((_) async => modelResponse),
    expect(mockCurrentWeatherRepository.getCurrentLocationWeather(params.toJson()), completes),

  });

 
  blocTest("cubit should have Success state as at [getCurrentLocationWeather]", 
  build: () =>currentWeatherCubit,
  act: (CurrentWeatherCubit cubit)
        { 
           when(mockCurrentWeatherRepository.getCurrentLocationWeather(params.toJson())).thenAnswer((_) async => modelResponse);
           cubit.getStatements(params);
        },
  expect: () => [isA<CurrentWeatherLoadingState>(), isA<CurrentWeatherSuccessState>()],
  verify: (_) {
    verify(mockCurrentWeatherRepository.getCurrentLocationWeather(params.toJson())).called(1);
  },
  );


}