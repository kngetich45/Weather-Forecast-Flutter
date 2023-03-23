import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'current_location_state.freezed.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState.init() = CurrentLocationInitState;
  const factory CurrentLocationState.error(String message) =
      CurrentLocationErrorState;
  const factory CurrentLocationState.success(Position currentLocation) =
      CurrentLocationSuccessState;
  const factory CurrentLocationState.loading() = CurrentLocationLoadingState;
}
