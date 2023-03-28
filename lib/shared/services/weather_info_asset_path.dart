import '../utils/assets.dart';

class WeatherInfoAssetPath {
  static fetchAssetFromTodayWeather(weather) {
    String assetPath = "";

     if (weather.contains("CLOUDS")) {
      
        assetPath =  Assets.cloudy;
     
    } else if (weather.contains("SUN")) {
      
        assetPath =  Assets.sunny2;
   
    } else if (weather.contains("RAIN")) {
      
        assetPath =  Assets.rainy;
      
    } else if (weather.contains("CLEAR")) {
      
       assetPath =  Assets.cloudy;
    
    } else if (weather.contains("WINDY")) {
     
        assetPath =  Assets.cloudy;
      
    } else if (weather.contains("storm")) {
      
       assetPath =  Assets.stomy;
      
    }

    return assetPath;
  }

    static fetchAssetFromTodaySmallWeather(weather) {
    String assetPath = "";

     if (weather.contains("Clouds")) {
      
        assetPath =  Assets.cloudy;
     
    } else if (weather.contains("sun")) {
      
        assetPath =  Assets.sunny2;
   
    } else if (weather.contains("Rain")) {
      
        assetPath =  Assets.rainy;
      
    } else if (weather.contains("clear")) {
      
       assetPath =  Assets.cloudy;
    
    } else if (weather.contains("windy")) {
     
        assetPath =  Assets.cloudy;
      
    } else if (weather.contains("storm")) {
      
       assetPath =  Assets.stomy;
      
    }

    return assetPath;
  }
}