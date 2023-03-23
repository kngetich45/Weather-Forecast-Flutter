import 'package:flutter/material.dart';
import 'package:weather_app/shared/utils/color.dart';

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: Palette.primaryTextColor),
    bodyText2: TextStyle(color: Palette.primaryTextColor),
  );
}
