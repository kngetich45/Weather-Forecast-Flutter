class FavoriteModel{
 
  String address; 
  double longitude; 
  double latitude; 
  double temp; 
  String weather;  

  FavoriteModel({required this.address,required this.longitude, required this.latitude, required this.temp, required this.weather});

  FavoriteModel.fromJson(Map<String, dynamic> json):
      
        address= json["address"],
        longitude= json["longtitude"],
        latitude= json['latitude'],
        temp= json['temp'],
        weather= json['weather']; 
  
  Map<String, dynamic> toJson() => {
       "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "temp": temp,
        "weather": weather,
      };

} 