import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/modules/core/data/prefs/shared_prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('SplashScreenCubit', () async {
    final preferences = await SharedPreferences.getInstance();
    late SplashScreenCubit splashScreenCubit;
    SharedHelper sharedHelper;
    sharedHelper = SharedHelperImpl(sharedPreferences: preferences);

    setUp(() {
      splashScreenCubit = SplashScreenCubit(sharedHelper);
    });

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
