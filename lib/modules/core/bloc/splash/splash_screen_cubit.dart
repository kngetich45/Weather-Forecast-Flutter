import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/modules/core/data/prefs/shared_prefs_helper.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final SharedHelper sharedPreferenceService;

  SplashScreenCubit(this.sharedPreferenceService) : super(SplashPageInitial());

  Future<void> checkStatus() async {
    //add initialization logic here if any
    try {
      var status = await Permission.location.status;
      await Future.delayed(const Duration(seconds: 3));
      if (status.isGranted) {
        emit(const Status(granted: true));
      } else {
        emit(const Status(granted: false));
      }
    } catch (e) {
      Fimber.e(e.toString());
      emit(const Status(granted: false));
    }
  }
}
