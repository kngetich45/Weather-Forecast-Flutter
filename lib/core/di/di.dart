import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/bloc/curentLocationCubit/current_location_cubit.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_cubit.dart';
import 'package:weather_app/core/bloc/language/langauge_cubit.dart';
import 'package:weather_app/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forecast_cubit.dart';
import 'package:weather_app/core/controller/current_weather_condition_controller.dart';
import 'package:weather_app/core/controller/weather_forecast_controller.dart';
import 'package:weather_app/core/data/prefs/shared_prefs_helper.dart';
import 'package:weather_app/core/network/api_provider.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/repository/weather_repository.dart';

GetIt inject = GetIt.instance;

Future<void> initializeInitiator() async {
  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()));

  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton<ApiProvider>(() => ApiProvider(dio: inject()));
  inject.registerLazySingleton<DioClient>(() => DioClient());

  //  api Repositories
  inject.registerLazySingleton<WeatherRepository>(
      () => WeatherRepository(inject()));

  // api Controllers
  inject.registerLazySingleton<CurrentWeatherController>(
      () => CurrentWeatherController(inject()));
  inject.registerLazySingleton<WeatherForecastController>(
      () => WeatherForecastController(inject()));

  // blocs
  inject.registerFactory<LanguageCubit>(() => LanguageCubit(inject()));
  inject.registerFactory<SplashScreenCubit>(() => SplashScreenCubit(inject()));
  inject.registerFactory<CurrentLocationCubit>(
      () => CurrentLocationCubit(inject()));
  inject.registerFactory<CurrentWeatherCubit>(
      () => CurrentWeatherCubit(currentWeatherController: inject()));
  inject.registerFactory<WeatherForecastCubit>(
      () => WeatherForecastCubit(weatherForecastController: inject()));
}
