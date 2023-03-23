import 'package:dartz/dartz.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';
import 'package:weather_app/core/data/error_response_model.dart';
import 'package:weather_app/core/repository/weather_repository.dart';
import 'package:weather_app/shared/services/controller_usecase_service.dart';

class WeatherForecastController
    extends UseCase<WeatherForecastModel, WeatherParams> {
  final WeatherRepository _weatherRepository;

  WeatherForecastController(this._weatherRepository);

  @override
  Future<Either<ErrorsModel, WeatherForecastModel>> call(
          WeatherParams params) async =>
      _weatherRepository.getWeatherForecast(params.toJson());
}
