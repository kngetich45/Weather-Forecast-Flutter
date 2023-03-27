import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/core/bloc/curentLocationCubit/current_location_state.dart';
import 'package:weather_app/core/data/prefs/shared_helper.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final SharedHelper sharedPreferenceService;
  CurrentLocationCubit(this.sharedPreferenceService)
      : super(const CurrentLocationInitState());

  Future getCurrentLocation() async { 
    emit(const CurrentLocationLoadingState());
    try {
      
      final Position response = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,);

      emit(CurrentLocationSuccessState(response));
    } catch (e) {
      emit(CurrentLocationErrorState(e.toString()));
    }
  }
}
