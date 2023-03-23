import 'package:weather_app/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';

import 'package:weather_app/core/data/error_response_model.dart';
import 'package:weather_app/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/network/endpoints.dart';

class WeatherRepository {
  final ApiProvider apiProvider;
  WeatherRepository(
    this.apiProvider,
  ); 
  Future<Either<ErrorsModel, WeatherForecastModel>> getWeatherForecast(
      Map<String, dynamic> params) async {
    try {
      var _res = await apiProvider.get(
        EndPoints.getWeatherForecast.url,
        queryParameters: params,
      );
      if (_res['cod'] == '200') {
        WeatherForecastModel _statements = WeatherForecastModel.fromJson(_res);
        return Right(_statements);
      } else {
        return Left(ErrorsModel.fromJson(_res));
      }
    } catch (e) {
      rethrow;
    }
  }


   
}
