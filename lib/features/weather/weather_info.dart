import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart'; 
import 'package:weather_app/shared/services/find_place_infor.dart';
import 'package:weather_app/shared/utils/assets.dart'; 
import 'package:shared_preferences/shared_preferences.dart'; 
import '../../core/bloc/currentCityWeatherCubit/current_city_weather_cubit.dart';
import '../../core/data/model/weather_city_params.dart'; 
import '../../core/data/model/favorite_model.dart';
import '../../core/data/model/weather_info_model.dart';
import '../../core/di/di.dart';
import '../../shared/utils/palette.dart';
import '../../shared/utils/styles.dart';
import '../favorite/favorite_weather.dart';

class WeatherInfo extends StatefulWidget {
  
  final Position position;
  final WeatherInfoModel weatherInfo;
  const WeatherInfo(this.position, {Key? key, required this.weatherInfo})
      : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
  
}

class _WeatherInfoState extends State<WeatherInfo> {
   @override
  void initState(){
    super.initState();
    initalGetSaveData();

  }
  late SharedPreferences sharedPreferences;
  
  void initalGetSaveData() async{
        sharedPreferences = await SharedPreferences.getInstance();
  }
void storeFavoriteData(address,longitude,latitude,temp,weather){
  FavoriteModel favoriteModel = FavoriteModel(address: address, longitude: longitude, latitude: latitude, temp: temp, weather: weather);
 
  String favoriteData = jsonEncode(favoriteModel); 
  sharedPreferences.setString('favorite', favoriteData);
}

  String assetPath = "";
  String address = '..';
  bool favoriteStatus = false;
  bool showButton = true;
  getPlaceInfo() async {
    String? info = await getAddressFromLatLong(widget.position);
    setState(() {
      address = info!;
    });
  }
  TextEditingController textController = TextEditingController();
  getCityName(String cityName){ 
   inject<CurrentCityWeatherCubit>()
          .getCityStatements(
            WeatherCityParams( 
                cityName: cityName,), 
     );
   
  }

 

  @override
  Widget build(BuildContext context) {
    getPlaceInfo();
    final mainWeather = widget.weatherInfo.weather![0].main!; 
    if (mainWeather.contains("Clouds")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (mainWeather.contains("sun")) {
      setState(() {
        assetPath = Assets.sunny2;
      });
    } else if (mainWeather.contains("Rain")) {
      setState(() {
        assetPath = Assets.rainy;
      });
    } else if (mainWeather.contains("clear")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (mainWeather.contains("windy")) {
      setState(() {
        assetPath = Assets.cloudy;
      });
    } else if (mainWeather.contains("storm")) {
      setState(() {
        assetPath = Assets.stomy;
      });
    }

    return Container(
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
       //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0,right: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
                SizedBox(
                  width: 200,
                  child: AnimSearchBar(
                                rtl: true,
                                width: MediaQuery.of(context).size.width,
                                color: Palette.primaryColor,
                                textController: textController,
                                suffixIcon: const Icon(
                                  Icons.close,
                                  color: Palette.white,
                                  size: 26,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Palette.white,
                                  size: 26,
                                ),
                                onSuffixTap: () { 
                                  setState(() {
                                    showButton = false;
                                  });
                                  FocusScope.of(context).unfocus();
                                  textController.clear();
                                },
                                style: Styles.inputTextStyle,
                                
                                 onSubmitted: (String x) {   
                                  getCityName(textController.text); 

                                 },
                    ),
                ),
                  const SizedBox(width: 10.0,),
                    IconButton(
                            iconSize: 55,
                            color: favoriteStatus?Palette.red: Palette.white,
                            onPressed: () {
                             storeFavoriteData(
                              address, 
                              widget.position.longitude,
                               widget.position.latitude, 
                               widget.weatherInfo.main!.temp!,
                                 mainWeather,);
                                 setState(() {
                                   favoriteStatus = true;
                                 });
                                
                            },
                            icon: const Icon(
                              Icons.favorite,
                            ),
                          ),
                    const SizedBox(width: 10.0,),
                    FloatingActionButton(
                        backgroundColor: Palette.primaryColor,
                        foregroundColor: Palette.white,
                        onPressed: () {Navigator.pushNamed( context, FavoriteWeather.routeName);},
                        child: const Text('Favorite',style: TextStyle(fontSize: 10),),
                      ),

                          
                  
              ],
            ),
          ),
          Text(address,
              style: TextStyle(
                  fontSize: 32.0.sp,
                  color: Palette.white,
                  fontFamily: "Roboto",),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.weatherInfo.main!.temp!.toStringAsFixed(0)}°",
                  style: TextStyle(
                      fontSize: 42.0.sp,
                      color: Palette.white,
                      fontFamily: "Roboto",),),
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: Container(
                  child: SvgPicture.asset(
                    assetPath,
                    color: Colors.white,
                    height: 86.0.h,
                    width: 86.1.h,
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(right: 8.0.spMin),
                ),
              ),
            ],
          ),
          Text(
            mainWeather,
            style: TextStyle(fontSize: 35.0.sp, color: Palette.white),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 64.0),
    );
  }
}