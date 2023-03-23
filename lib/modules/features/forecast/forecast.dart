// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/modules/components/custom_list_tile.dart';
import 'package:weather_app/modules/core/bloc/currentWeatherCubit/data/current_location_params.dart';
import 'package:weather_app/modules/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/data/weather_forecast_response_model.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/weather_forcast_state.dart';
import 'package:weather_app/modules/core/bloc/weatherForecastCubit/weather_forecast_cubit.dart';
import 'package:weather_app/modules/core/di/di.dart';
import 'package:weather_app/modules/shared/services/day_convertion.dart';
import 'package:weather_app/modules/shared/widgets/toast.dart';

class ForecastList extends StatefulWidget {
  final Position position;
  final WeatherInfoModel weatherInfo;

  const ForecastList(this.position, {Key? key, required this.weatherInfo})
      : super(key: key);

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  List<ListElement> forecastData = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<WeatherForecastCubit>()
        ..getStatements(
          WeatherParams(
              longitude: widget.position.longitude,
              latitude: widget.position.latitude),
        ),
      child: BlocConsumer<WeatherForecastCubit, WeatherForecastState>(
          listener: (ctx, state) {
        state.maybeWhen(
          success: (forecast) {
            ToastUtils.showSuccessToast("Updated");
            List<ListElement> el = forecast.list!;
            Set<int> existingDicts = {};
            List<ListElement> filteredList = [];
            for (var element in el) {
              if (existingDicts
                  .contains(DateTime.parse(element.dtTxt.toString()).weekday)) {
              } else {
                existingDicts
                    .add(DateTime.parse(element.dtTxt.toString()).weekday);
                filteredList.add(element);
              }
            }

            setState(() {
              forecastData = filteredList;
            });
          },
          error: (message) {
            ToastUtils.showErrorToast(message);
          },
          orElse: () {},
        );
      }, builder: (ctx, state) {
        return forecastData.isEmpty
            ? const SpinKitCircle(
                color: Colors.white,
                size: 40.0,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomListTile(
                    leading: "${widget.weatherInfo.main!.tempMin}°\nmin",
                    title: "${widget.weatherInfo.main!.temp}°\ncurent",
                    trailing: "${widget.weatherInfo.main!.tempMax}°\nmax",
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: forecastData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _ForecastListItem(
                              forecast: forecastData[index]);
                        }),
                  ),
                ],
              );
      }),
    );
  }
}

class _ForecastListItem extends StatelessWidget {
  final ListElement? forecast;
  const _ForecastListItem({this.forecast});

  @override
  Widget build(BuildContext context) {
//     date = new Date('2013-03-10T02:00:00Z');
// date.getFullYear()+'-' + (date.getMonth()+1) + '-'+date.getDate();
    var day = DateTime.parse(forecast!.dtTxt!.toString()).toLocal().weekday;

    // if (day == 1) {
    //   weekday = "Sunday";
    // } else if (day == 2) {
    //   weekday = "Monday";
    // } else if (day == 3) {
    //   weekday = "Tuesday";
    // } else if (day == 4) {
    //   weekday = "Wednesday";
    // } else if (day == 5) {
    //   weekday = "Thursday";
    // } else if (day == 6) {
    //   weekday = "Friday";
    // } else if (day == 7) {
    //   weekday = "Saturday";
    // }

    return Material(
      child: InkWell(
        child: Container(
          color: const Color.fromARGB(185, 0, 141, 2),
          height: 65.0.h,
          padding: EdgeInsets.symmetric(horizontal: 12.0.sm, vertical: 8.0.sm),
          child: CustomListTile(
            leading: Convertion.convertWeekDayToDay(day),
            trailing: "${forecast!.main!.temp}°",
          ),
        ),
      ),
    );
  }
}
