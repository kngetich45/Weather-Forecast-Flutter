import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/homePage/home_screen.dart';
import 'package:weather_app/features/splashScreen/splash_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => myRoute(const SplashPage()),
  MyHomePage.routeName: (context) => myRoute(const MyHomePage()),
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
