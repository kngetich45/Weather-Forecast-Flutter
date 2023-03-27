import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_state.dart'; 

import '../../repository/current_weather_repository.dart'; 
import 'data/weather_params.dart';
import 'data/weather_info_model.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentWeatherRepository currentWeatherRepository;

  CurrentWeatherCubit({
    required this.currentWeatherRepository,
  }) : super(const CurrentWeatherInitState());

  Future getStatements(WeatherParams weatherParams) async {
    emit(const CurrentWeatherLoadingState());
    try {
      final WeatherInfoModel eitherResponse = 
         await currentWeatherRepository.getCurrentLocationWeather(weatherParams.toJson()); 
        emit(CurrentWeatherSuccessState(eitherResponse));
    } catch (e) {
      emit(CurrentWeatherState.error(e.toString()));
    }
  }
}
