import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/bloc/currentWeatherCubit/data/current_weather_condition_response_model.dart';
import 'package:weather_app/shared/services/find_place_infor.dart';
import 'package:weather_app/shared/utils/assets.dart';
import 'package:weather_app/shared/utils/color.dart';

class WeatherInfo extends StatefulWidget {
  final Position position;
  final WeatherInfoModel weatherInfo;
  const WeatherInfo(this.position, {Key? key, required this.weatherInfo})
      : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  String assetPath = "";
  String address = '..';
  getPlaceInfo() async {
    String? info = await getAddressFromLatLong(widget.position);
    setState(() {
      address = info!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getPlaceInfo();
    if (widget.weatherInfo.weather![0].main!.contains("Clouds")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (widget.weatherInfo.weather![0].main!.contains("sun")) {
      setState(() {
        assetPath = Assets.sunny2;
      });
    } else if (widget.weatherInfo.weather![0].main!.contains("Rain")) {
      setState(() {
        assetPath = Assets.rainy;
      });
    } else if (widget.weatherInfo.weather![0].main!.contains("clear")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (widget.weatherInfo.weather![0].main!.contains("windy")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (widget.weatherInfo.weather![0].main!.contains("storm")) {
      setState(() {
        assetPath = Assets.stomy;
      });
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(address,
              style: TextStyle(
                  fontSize: 32.0.sp,
                  color: Palette.white,
                  fontFamily: "Roboto")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${widget.weatherInfo.main!.temp}°",
                  style: TextStyle(
                      fontSize: 42.0.sp,
                      color: Palette.white,
                      fontFamily: "Roboto")),
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: Container(
                  child: SvgPicture.asset(
                    assetPath,
                    color: Colors.white,
                    height: 86.0.h,
                    width: 86.0.h,
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(right: 8.0.spMin),
                ),
              ),
            ],
          ),
          Text(
            widget.weatherInfo.weather![0].main!,
            style: TextStyle(fontSize: 35.0.sp, color: Palette.white),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 64.0),
    );
  }
}
