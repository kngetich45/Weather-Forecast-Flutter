part of 'splash_screen_cubit.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class SplashPageInitial extends SplashScreenState {}

class Status extends SplashScreenState {
  final bool granted;

  const Status({this.granted = false});
}
