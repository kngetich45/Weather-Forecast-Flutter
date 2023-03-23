import 'package:weather_app/modules/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';

import 'package:weather_app/modules/core/data/error_response_model.dart';
import 'package:weather_app/modules/core/network/api_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/core/network/endpoints.dart';

class WeatherRepository {
  final ApiProvider apiProvider;
  WeatherRepository(
    this.apiProvider,
  );

  Future<Either<ErrorsModel, WeatherInfoModel>> getCurrentLocationWeather(
      Map<String, dynamic> params) async {
    try {
      var _res = await apiProvider.get(
        EndPoints.getCurrentWeather.url,
        queryParameters: params,
      );
      if (_res['coord']['lon'] != null) {
        WeatherInfoModel _statements = WeatherInfoModel.fromJson(_res);
        return Right(_statements);
      } else {
        return Left(ErrorsModel.fromJson(_res));
      }
    } catch (e) {
      rethrow;
    }
  }

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
