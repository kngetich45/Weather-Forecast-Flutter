import 'package:after_layout/after_layout.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/modules/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/modules/core/di/di.dart';
import 'package:weather_app/modules/features/homePage/home_screen.dart';
import 'package:weather_app/modules/shared/utils/assets.dart';
import 'package:weather_app/modules/shared/utils/color.dart';
import 'package:weather_app/modules/shared/utils/screen_util.dart';
import 'package:weather_app/modules/shared/utils/styles.dart';
import 'package:weather_app/modules/shared/widgets/toast.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'SplashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
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
        listener: (context, state) async {
          if (state is Status) {
            if (state.granted) {
              // Navigate to home
              Navigator.pushNamedAndRemoveUntil(
                  context, MyHomePage.routeName, (route) => false);
            } else {
              await Permission.location.request();

              ToastUtils.showInfoToast(
                  "Ensure access to location to enjoy our services.");
              Navigator.pushNamedAndRemoveUntil(
                  context, SplashPage.routeName, (route) => false);
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
                )
              ],
            ))),
      ),
    );
  }
}
