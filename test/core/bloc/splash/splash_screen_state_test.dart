import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart'; 
import 'package:weather_app/core/bloc/splash/splash_screen_cubit.dart';
import 'package:weather_app/core/data/prefs/shared_helper.dart'; 
import 'package:bloc_test/bloc_test.dart';

import 'splash_screen_state_test.mocks.dart';
 
@GenerateMocks([SharedHelper])
 void main()  {
 // late SharedPreferences preferences;
  late MockSharedHelper sharedHelper;
  late SplashScreenCubit splashScreenCubit;

     setUp(() {
       //preferences = await SharedPreferences.getInstance();
      sharedHelper = MockSharedHelper();
      splashScreenCubit = SplashScreenCubit(sharedHelper);
     
    });
   group('SplashScreenCubit', () {
       
    blocTest<SplashScreenCubit, SplashScreenState>(
        "it emits permission status as either granted or not granted",
        build: () => splashScreenCubit,
        act: (SplashScreenCubit cubit) => cubit.checkStatus().then((value) => value),
        expect: () => [const Status()],);
      

    tearDown(() {
      splashScreenCubit.close();
    });
   });
}
