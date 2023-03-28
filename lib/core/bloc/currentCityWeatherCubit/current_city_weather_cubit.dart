import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_state.dart';

import '../../data/model/weather_info_model.dart';
import '../../repository/current_city_weather_repository.dart'; 
import '../../data/model/weather_city_params.dart'; 

class CurrentCityWeatherCubit extends Cubit<CurrentWeatherState> { 
  final CurrentCityWeatherRepository currentCityWeatherRepository;

  CurrentCityWeatherCubit({
    required this.currentCityWeatherRepository,
  }) : super(const CurrentWeatherState.init());
 
 Future getCityStatements(WeatherCityParams weatherCityParams) async {
    try {
      final  WeatherInfoModel eitherResponse =
          await currentCityWeatherRepository.getCurrentCityWeather(weatherCityParams.toJson());
 
            return CurrentWeatherState.success(eitherResponse);
    
    } catch (e) {
      emit(CurrentWeatherState.error(e.toString()));
    }
  }
}