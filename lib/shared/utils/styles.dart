import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'palette.dart'; 

class Styles {
  static TextStyle loginTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 20.sp,
  );
  static TextStyle exploreTextStyle = TextStyle(
    color: Palette.primaryColor,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
  );

  static TextStyle onboardingTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontSize: 16.sp,
  );

  static TextStyle toolbarTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );

  static TextStyle snackTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'NunitoSans',
    fontSize: 16.sp,
  );

  static TextStyle normalTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 16.sp,
  );

  static TextStyle longTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 14.sp,
  );
  static TextStyle inputTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 18.sp,
  );
  static TextStyle hintTextStyle = TextStyle(
    color: Palette.secondaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 16.sp,
  );

  static TextStyle normalTitleTextStyle = TextStyle(
    color: Palette.titleColor,
    fontFamily: 'Nunito',
    fontSize: 20.sp,
  );

  static TextStyle tabTitleTextStyle = TextStyle(
    color: Palette.tabTitle,
    fontFamily: 'Nunito',
    fontSize: 14.sp,
  );

  static TextStyle subTitle = TextStyle(
    color: Palette.secondaryTextColor,
    fontFamily: 'Nunito',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle snackBarText = TextStyle(
    color: Palette.errorTextColor,
    fontSize: 14.sp,
  );
  static TextStyle errorText = TextStyle(
    color: Palette.errorTextColor,
    fontSize: 14.sp,
  );
}
