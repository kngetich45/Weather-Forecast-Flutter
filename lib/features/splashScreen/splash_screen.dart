import 'package:after_layout/after_layout.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/core/di/di.dart';
import 'package:weather_app/features/homePage/home_screen.dart';
import 'package:weather_app/shared/utils/assets.dart';
import 'package:weather_app/shared/utils/palette.dart';
import 'package:weather_app/shared/utils/screen_util.dart';
import 'package:weather_app/shared/utils/styles.dart';
import 'package:weather_app/shared/widgets/toast_type.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashPage';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  // ignore: no-empty-block
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    setUpScreenUtil(context);
    if (kDebugMode) {
      print("SPLASHHH");
    }
    
    return BlocProvider(
      create: (context) => inject.get<SplashScreenCubit>()..checkStatus(),
      child: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) async  {
          if (state is Status) {
            if (state.granted) {
              // Navigate to home
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false,);
            } else {
              await Permission.location.request();

              ToastUtils.showInfoToast(
                  "Ensure access to location to enjoy our services.",);
              Navigator.pushNamedAndRemoveUntil(
                  context, SplashScreen.routeName, (route) => false,);
            }
          }
        },
        child: Scaffold(
            backgroundColor: Palette.primaryColor,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 140.h,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.logo,
                    height: 132.h,
                  ),
                ),
                Text(
                  'Our Forecast',
                  style: Styles.normalTextStyle
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                const SpinKitCircle(
                  color: Colors.white,
                  size: 40.0,
                ),
              ],
            ),),),
      ),
    );
  }
}
