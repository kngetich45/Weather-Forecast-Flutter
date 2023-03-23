class WeatherParams {
  WeatherParams({
    required this.longitude,
    required this.latitude,
    this.key = "62429f7781c035b5d8f16a3fb43f6b85",
  });

  double longitude;
  double latitude;
  String? key;

  factory WeatherParams.fromJson(Map<String, dynamic> json) => WeatherParams(
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "lat": latitude,
        "lon": longitude,
        "appid": key,
      };
}
