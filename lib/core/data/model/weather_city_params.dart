class WeatherCityParams {
  WeatherCityParams({
    required this.cityName, 
   // this.key = "62429f7781c035b5d8f16a3fb43f6b85",
    this.key = "62429f7781c035b5d8f16a3fb43f6b85",
  });

  String cityName; 
  String? key;

  factory WeatherCityParams.fromJson(Map<String, dynamic> json) => WeatherCityParams(
        cityName: json["cityName"], 
      );

  Map<String, dynamic> toJson() => {
        "q": cityName, 
        "appid": key,
      };
}