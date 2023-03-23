// ignore_for_file: constant_identifier_names

enum EndPoints {
  getCurrentWeather,
  getWeatherForecast,
}

extension Url on EndPoints {
  // static String? baseUrl = dotenv.env['API_BASE_URL'];
  static String? baseUrl = "https://api.openweathermap.org/data/2.5/";

  String get url {
    switch (this) {
      case EndPoints.getCurrentWeather:
        return "${baseUrl}weather/";
      case EndPoints.getWeatherForecast:
        return "${baseUrl}forecast";

      default:
        throw Exception('Url not set');
    }
  }
}
