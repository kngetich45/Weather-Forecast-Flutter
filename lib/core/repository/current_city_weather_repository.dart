import 'package:fimber/fimber.dart'; 

import 'package:weather_app/core/network/api_provider.dart';
import 'package:weather_app/core/network/endpoints.dart';

import '../data/model/weather_info_model.dart';

abstract class CurrentCityWeatherRepository{
    Future<WeatherInfoModel> getCurrentCityWeather(Map<String, dynamic> params);

}

class CurrentCityWeatherRepositoryIml implements CurrentCityWeatherRepository {
  final ApiProvider apiProvider;

  CurrentCityWeatherRepositoryIml(
    this.apiProvider,
  );

  @override
  Future<WeatherInfoModel> getCurrentCityWeather(
      Map<String, dynamic> params,) async {
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
