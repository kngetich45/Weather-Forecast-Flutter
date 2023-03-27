import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/weather_params.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/data/weather_forecast_model.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forecast_state.dart'; 
import 'package:weather_app/core/repository/weather_repository.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> { 
    final WeatherRepository weatherRepository;

  WeatherForecastCubit({
    required this.weatherRepository,
  }) : super(const WeatherForecastInitState());

  Future getStatements(WeatherParams weatherParams) async { 
    try {
      emit(const WeatherForecastLoadingState());
      final WeatherForecastModel eitherResponse = 
          await weatherRepository.getWeatherForecast(weatherParams.toJson()); 
            emit( WeatherForecastSuccessState(eitherResponse)); 
    } catch (e) {
      emit(WeatherForecastErrorState(e.toString()));
    }
  }
}
