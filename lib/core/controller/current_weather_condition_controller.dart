import 'package:dartz/dartz.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart';

import 'package:weather_app/core/data/error_response_model.dart';
import 'package:weather_app/core/repository/weather_repository.dart';
import 'package:weather_app/shared/services/controller_usecase_service.dart';

class CurrentWeatherController
    extends UseCase<WeatherInfoModel, WeatherParams> {
  final WeatherRepository _weatherRepository;

  CurrentWeatherController(this._weatherRepository);

  @override
  Future<Either<ErrorsModel, WeatherInfoModel>> call(
          WeatherParams params) async =>
      _weatherRepository.getCurrentLocationWeather(params.toJson());
}
