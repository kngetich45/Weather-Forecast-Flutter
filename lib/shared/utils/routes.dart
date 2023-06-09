import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../features/favorite/favorite_weather.dart';
import '../../features/favorite/favorite_weather_details.dart';
import '../../features/homePage/home_screen.dart';
import '../../features/splashScreen/splash_screen.dart'; 

//final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => myRoute(const SplashScreen()),
  HomeScreen.routeName: (context) => myRoute(const HomeScreen()),
  FavoriteWeather.routeName: (context) => myRoute(const FavoriteWeather()),
  FavoriteWeatherDetails.routeName: (context) => myRoute(const FavoriteWeatherDetails()),
};

//set icon colors to black and status bar colors to white for Android.
Widget myRoute(var widget) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: widget,
  );
}
