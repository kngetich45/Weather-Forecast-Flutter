// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart'; 

import '../../components/custom_list_tile.dart'; 
import '../../core/data/model/weather_forecast_model.dart';
import '../../core/bloc/weatherForecastCubit/weather_forecast_state.dart';
import '../../core/bloc/weatherForecastCubit/weather_forecast_cubit.dart';
import '../../core/data/model/weather_info_model.dart';
import '../../core/data/model/weather_params.dart';
import '../../core/di/di.dart';
import '../../shared/services/day_convertion.dart';
import '../../shared/widgets/toast_type.dart';

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
    var dataMain = widget.weatherInfo.main!;

    return BlocProvider( 
      create: (context) => inject<WeatherForecastCubit>()
        ..getStatements(
          WeatherParams(
              longitude: widget.position.longitude,
              latitude: widget.position.latitude,),
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
              var dataDate = DateTime.parse(element.dtTxt.toString());
              if (existingDicts
                  // ignore: no-empty-block
                  .contains(dataDate.weekday)) {
              } else {
                existingDicts
                    .add(dataDate.weekday);
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
          // ignore: no-empty-block
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
                    leading: "${dataMain.tempMin!.toStringAsFixed(0)}°\nmin",
                    title: "${dataMain.temp!.toStringAsFixed(0)}°\ncurent",
                    trailing: "${dataMain.tempMax!.toStringAsFixed(0)}°\nmax",
                     assetPath:  "${widget.weatherInfo.main!}" ,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: forecastData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _ForecastListItem(
                              forecast: forecastData[index],);
                        },),
                  ),
                ],
              );
      },),
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
 

    return Material(
      child: InkWell(
        child: Container(
          color: const Color.fromARGB(185, 0, 141, 2),
          height: 65.0.h,
          padding: EdgeInsets.symmetric(horizontal: 12.0.spMin, vertical: 8.0.spMin),
          child: CustomListTile(
            leading: DayConvertion.convertWeekDayToDay(day),
            trailing: "${forecast!.main!.temp!.toStringAsFixed(0)}°",
           assetPath: "${forecast!.weather!.map((x) => x.main)}", 
          ),
        ),
      ),
    );
  }
}
