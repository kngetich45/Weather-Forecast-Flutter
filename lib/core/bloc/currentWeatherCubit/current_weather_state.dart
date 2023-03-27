import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/weather_info_model.dart';

part 'current_weather_state.freezed.dart';

@freezed
class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState.init() = CurrentWeatherInitState;
  const factory CurrentWeatherState.error(String message) =
      CurrentWeatherErrorState;
  const factory CurrentWeatherState.success(WeatherInfoModel currentWeather) =
      CurrentWeatherSuccessState;
  const factory CurrentWeatherState.loading() = CurrentWeatherLoadingState;
}
