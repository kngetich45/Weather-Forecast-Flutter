import 'package:flutter/material.dart';

import 'palette.dart'; 

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: Palette.primaryTextColor),
    bodyMedium: TextStyle(color: Palette.primaryTextColor),
  );
}
