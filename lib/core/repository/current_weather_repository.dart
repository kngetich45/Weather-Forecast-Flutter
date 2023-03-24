import 'package:fimber/fimber.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart'; 

import 'package:weather_app/core/data/error_response_model.dart';
import 'package:weather_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/network/endpoints.dart';

abstract class CurrentWeatherRepository{
    Future<WeatherInfoModel> getCurrentLocationWeather(Map<String, dynamic> params);

}

class CurrentWeatherRepositoryIml implements CurrentWeatherRepository {
  final ApiProvider apiProvider;

  CurrentWeatherRepositoryIml(
    this.apiProvider,
  );

  @override
  Future<WeatherInfoModel> getCurrentLocationWeather(
      Map<String, dynamic> params) async {
    try { 
       WeatherInfoModel _model ;
      var _res = await apiProvider.get(
        EndPoints.getCurrentWeather.url,
        queryParameters: params,
      );
      if (_res['coord']['lon'] != null) {
               _model = WeatherInfoModel.fromJson(_res); 
        return _model;
      } else {
        Fimber.e("Error message");
        _model = WeatherInfoModel.fromJson({}); 
        return _model;
      }
    } catch (e) {
      rethrow;
    }
  } 
}