import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/weather_forcast_state.dart';
import 'package:weather_app/modules/core/controller/weather_forecast_controller.dart';
import 'package:weather_app/modules/core/data/error_response_model.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  final WeatherForecastController weatherForecastController;

  WeatherForecastCubit({
    required this.weatherForecastController,
  }) : super(const WeatherForecastState.init());

  void getStatements(WeatherParams weatherParams) async {
    try {
      final Either<ErrorsModel, WeatherForecastModel> eitherResponse =
          await weatherForecastController(weatherParams);

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
