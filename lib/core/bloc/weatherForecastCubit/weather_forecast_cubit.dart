import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/weather_forcast_state.dart'; 
import 'package:weather_app/core/data/error_response_model.dart';
import 'package:weather_app/core/repository/weather_repository.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> { 
    final WeatherRepository weatherRepository;

  WeatherForecastCubit({
    required this.weatherRepository,
  }) : super(const WeatherForecastState.init());

  void getStatements(WeatherParams weatherParams) async {
    try {
      final Either<ErrorsModel, WeatherForecastModel> eitherResponse = 
          await weatherRepository.getWeatherForecast(weatherParams.toJson());

      emit(
        eitherResponse.fold(
          (l) {
            return WeatherForecastState.error(l.message!);
          },
          (r) {
            return WeatherForecastState.success(r);
          },
        ),
      );
    } catch (e) {
      emit(WeatherForecastState.error(e.toString()));
    }
  }
}
