import 'package:fimber/fimber.dart';
import 'package:weather_app/core/data/model/weather_forecast_model.dart';

import 'package:weather_app/core/network/api_provider.dart';
import 'package:weather_app/core/network/endpoints.dart';

abstract class WeatherRepository{
      Future<WeatherForecastModel> getWeatherForecast(Map<String, dynamic> params);
} 

class WeatherRepositoryIml implements WeatherRepository{
  final ApiProvider apiProvider;
  WeatherRepositoryIml(
    this.apiProvider,
  ); 
  @override
  Future<WeatherForecastModel> getWeatherForecast(

      Map<String, dynamic> params,) async {
    try {
      WeatherForecastModel _statements; 
      var _res = await apiProvider.get(
        EndPoints.getWeatherForecast.url,
        queryParameters: params,
      );
      if (_res['cod'] == '200') {
         _statements = WeatherForecastModel.fromJson(_res);

        return  _statements;
      } else {
         Fimber.e("Error message");
         _statements = WeatherForecastModel.fromJson({}); 

        return _statements;
      }
    } catch (e) {
      rethrow;
    }
  }


   
}
