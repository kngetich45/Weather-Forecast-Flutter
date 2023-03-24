import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_state.dart'; 

import '../../repository/current_weather_repository.dart'; 
import 'data/current_location_params.dart';
import 'data/current_weather_condition_response_model.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentWeatherRepository currentWeatherRepository;

  CurrentWeatherCubit({
    required this.currentWeatherRepository,
  }) : super(const CurrentWeatherState.init());

  Future<void> getStatements(WeatherParams weatherParams) async {
    try {
      final WeatherInfoModel eitherResponse = 
         await currentWeatherRepository.getCurrentLocationWeather(weatherParams.toJson()); 
        emit(CurrentWeatherState.success(eitherResponse));
    } catch (e) {
      emit(CurrentWeatherState.error(e.toString()));
    }
  }
}
