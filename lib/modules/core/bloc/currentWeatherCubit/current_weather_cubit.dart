import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/core/bloc/currentWeatherCubit/current_weather_state.dart';

import 'package:weather_app/modules/core/controller/current_weather_condition_controller.dart';
import 'package:weather_app/modules/core/data/error_response_model.dart';

import 'data/current_location_params.dart';
import 'data/current_weather_condition_response_model.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentWeatherController currentWeatherController;

  CurrentWeatherCubit({
    required this.currentWeatherController,
  }) : super(const CurrentWeatherState.init());

  void getStatements(WeatherParams weatherParams) async {
    try {
      final Either<ErrorsModel, WeatherInfoModel> eitherResponse =
          await currentWeatherController(weatherParams);

      emit(
        eitherResponse.fold(
          (l) {
            return CurrentWeatherState.error(l.message!);
          },
          (r) {
            return CurrentWeatherState.success(r);
          },
        ),
      );
    } catch (e) {
      emit(CurrentWeatherState.error(e.toString()));
    }
  }
}
