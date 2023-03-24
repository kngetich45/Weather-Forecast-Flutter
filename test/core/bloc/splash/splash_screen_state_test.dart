import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/core/data/prefs/shared_prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc_test/bloc_test.dart';

void main()  async {
  late final SharedPreferences preferences;
  late SharedHelper sharedHelper;
  late SplashScreenCubit splashScreenCubit;

     setUp(() async {
       preferences = await SharedPreferences.getInstance();
      sharedHelper = SharedHelperImpl(sharedPreferences: preferences);
      splashScreenCubit = SplashScreenCubit(sharedHelper);
     
    });
   group('SplashScreenCubit', () async {
       
    blocTest<SplashScreenCubit, SplashScreenState>(
        "it emits permission status as either granted or not granted",
        build: () => splashScreenCubit,
        act: (cubit) => cubit.checkStatus(),
        expect: () => [SplashPageInitial(), const Status()]);

    tearDown(() {
      splashScreenCubit.close();
    });
   });
}
