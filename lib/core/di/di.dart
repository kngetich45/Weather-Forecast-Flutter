import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/bloc/curentLocationCubit/current_location_cubit.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_cubit.dart';
import 'package:weather_app/core/bloc/language/language_cubit.dart';
import 'package:weather_app/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forecast_cubit.dart'; 
import 'package:weather_app/core/data/prefs/shared_helper.dart';
import 'package:weather_app/core/network/api_provider.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/repository/weather_repository.dart';

import '../bloc/currentCityWeatherCubit/current_city_weather_cubit.dart';
import '../repository/current_city_weather_repository.dart';
import '../repository/current_weather_repository.dart';

GetIt inject = GetIt.instance;

Future<void> initializeInitiator() async {
  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()),);
   SharedHelperImpl(sharedPreferences: inject());

  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton<ApiProvider>(() => ApiProvider(dio: inject()));
  inject.registerLazySingleton<DioClient>(() => DioClient());

  //  api Repositories
  inject.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryIml(inject()),);
  inject.registerLazySingleton<CurrentWeatherRepository>(
      () => CurrentWeatherRepositoryIml(inject()),);
   inject.registerLazySingleton<CurrentCityWeatherRepository>(
      () => CurrentCityWeatherRepositoryIml(inject()),);
 
  inject.registerFactory<CurrentWeatherCubit>(
      () => CurrentWeatherCubit(currentWeatherRepository: inject()),); 
  inject.registerFactory<WeatherForecastCubit>(
      () => WeatherForecastCubit(weatherRepository: inject()),);
      

  // blocs
  inject.registerFactory<LanguageCubit>(() => LanguageCubit(inject()));
  inject.registerFactory<SplashScreenCubit>(() => SplashScreenCubit(inject()));
  inject.registerFactory<CurrentLocationCubit>(
      () => CurrentLocationCubit(inject()),);  
  inject.registerFactory<CurrentCityWeatherCubit>(
      () => CurrentCityWeatherCubit(currentCityWeatherRepository: inject()),);    
}
