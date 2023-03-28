import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/services/weather_info_asset_path.dart'; 
import '../../shared/utils/palette.dart';

class FavoriteWeatherDetails extends StatefulWidget {
   static const routeName = 'FavoriteWeatherDetails';
  
  const FavoriteWeatherDetails({Key? key}) : super(key: key);

  @override
  State<FavoriteWeatherDetails> createState() => _FavoriteWeatherDetailsState();
}

class _FavoriteWeatherDetailsState extends State<FavoriteWeatherDetails> {
  
  @override
  Widget build(BuildContext context) {
    

    final favorite = ModalRoute.of(context)!.settings.arguments as Map;
     
     return Scaffold(
       appBar: AppBar(title: const Text("Favorite Details")),
       backgroundColor: Palette.primaryColor,
       body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Text(favorite['address'].toString(),
                style: TextStyle(
                    fontSize: 32.0.sp,
                    color: Palette.white,
                    fontFamily: "Roboto",),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${favorite['temp']!.toStringAsFixed(2)}°",
                    style: TextStyle(
                        fontSize: 42.0.sp,
                        color: Palette.white,
                        fontFamily: "Roboto",),),
                 Container(
                    child: SvgPicture.asset(
                     WeatherInfoAssetPath.fetchAssetFromTodaySmallWeather(favorite['weather']),
                      
                      color: Colors.white,
                      height: 86.0.h,
                      width: 86.1.h,
                      fit: BoxFit.cover,
                    ),
                    margin: EdgeInsets.only(right: 8.0.spMin),
                  ),
                
              ],
            ),
            Text(
              favorite['weather'].toString(),
              style: TextStyle(fontSize: 35.0.sp, color: Palette.white),
            ),
          ],
        ),  
     );
  }
} 