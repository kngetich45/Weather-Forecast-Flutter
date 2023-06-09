import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
/* double getProportionateScreenHeight(double inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use

  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  var screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  
  return (inputWidth / 375.0) * screenWidth;
}
 */