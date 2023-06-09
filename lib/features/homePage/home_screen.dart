import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/bloc/curentLocationCubit/current_location_cubit.dart';
import 'package:weather_app/core/bloc/curentLocationCubit/current_location_state.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_cubit.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/current_weather_state.dart'; 
import 'package:weather_app/core/di/di.dart';
import 'package:weather_app/features/forecast/forecast_list.dart';
import 'package:weather_app/features/weather/weather_info.dart';
import 'package:weather_app/shared/widgets/toast_type.dart';

import '../../core/data/model/weather_info_model.dart';
import '../../core/data/model/weather_params.dart';
import '../../shared/utils/assets.dart';  

class HomeScreen extends StatefulWidget {
  static const routeName = 'MyHomePage';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _position;
  WeatherInfoModel? _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<CurrentLocationCubit>()..getCurrentLocation(),
      child: BlocConsumer<CurrentLocationCubit, CurrentLocationState>(
          listener: (ctx, state) {
        state.maybeWhen(
          success: (position) {
            ToastUtils.showSuccessToast(
                "Location pinged successfully. Rendering ${position.heading}",);
            setState(() {
              _position = position;
            });
          },
          error: (message) {
            ToastUtils.showErrorToast(message);
          },
          // ignore: no-empty-block
          orElse: () {},
        );
      }, builder: (ctx, state) {
        return Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(Assets.backGround),
                fit: BoxFit.cover,
              ),),
              child: _position == null
                  ? const SpinKitCircle(
                      color: Colors.white,
                      size: 50.0,
                    )
                  : Column(
                      children: <Widget>[
                        AspectRatio(
                            child: BlocProvider(
                              create: (context) => inject<CurrentWeatherCubit>()
                                ..getStatements(
                                  WeatherParams(
                                      longitude: _position!.longitude,
                                      latitude: _position!.latitude,),
                                ),
                              child: BlocConsumer<CurrentWeatherCubit,
                                  CurrentWeatherState>(
                                listener: (ctx, state) {
                                  state.maybeWhen(
                                    success: (weather) {
                                      ToastUtils.showSuccessToast("Updated");
                                      setState(() {
                                        _weatherInfo = weather;
                                      });
                                    },
                                    error: (message) {
                                      ToastUtils.showErrorToast(message);
                                    },
                                    // ignore: no-empty-block
                                    orElse: () {},
                                  );
                                },
                                builder: (ctx, state) {
                                  // ignore: avoid-nested-conditional-expressions
                                  return _weatherInfo == null
                                      ? const SpinKitCircle(
                                          color: Colors.white,
                                          size: 40.0,
                                        )
                                      : WeatherInfo(
                                          _position!,
                                          weatherInfo: _weatherInfo!,
                                        );
                                },
                              ),
                            ),
                            aspectRatio: 750.0 / 805.0,),
                        Expanded(
                            // ignore: avoid-nested-conditional-expressions
                            child: _weatherInfo == null
                                ? const SizedBox.shrink()
                                : ForecastList(
                                    _position!,
                                    weatherInfo: _weatherInfo!,
                                  ),),
                      ],
                    ),),
        );
      },),
    );
  }
}
