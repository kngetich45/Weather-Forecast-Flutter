import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/model/weather_forecast_model.dart';

part 'weather_forcast_state.freezed.dart';

@freezed
class WeatherForecastState with _$WeatherForecastState {
  const factory WeatherForecastState.init() = WeatherForecastInitState;
  const factory WeatherForecastState.error(String message) =
      WeatherForecastErrorState;
  const factory WeatherForecastState.success(
      WeatherForecastModel weatherForecast,) = WeatherForecastSuccessState;
  const factory WeatherForecastState.loading() = WeatherForecastLoadingState;
}
