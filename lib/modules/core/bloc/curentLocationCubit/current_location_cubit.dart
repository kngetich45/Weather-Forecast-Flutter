import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/modules/core/bloc/curentLocationCubit/current_location_state.dart';
import 'package:weather_app/modules/core/data/prefs/shared_prefs_helper.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final SharedHelper sharedPreferenceService;
  CurrentLocationCubit(this.sharedPreferenceService)
      : super(const CurrentLocationState.init());

  Future<void> getCurrentLocation() async {
    emit(const CurrentLocationState.loading());
    try {
      emit(const CurrentLocationState.loading());
      final Position response = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      emit(CurrentLocationState.success(response));
    } catch (e) {
      emit(CurrentLocationState.error(e.toString()));
    }
  }
}
