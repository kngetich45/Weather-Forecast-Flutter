import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';  

import '../shared/services/weather_info_asset_path.dart';
import '../shared/utils/assets.dart';
import '../shared/utils/palette.dart';

class CustomListTile extends StatelessWidget {
  final String leading;
  final String? title;
  final String trailing;
  final String? assetPath;
  const CustomListTile(
      {Key? key,
      required this.leading,
      this.title,
      required this.trailing,
      this.assetPath,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0.sp, right: 12.0.spMin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: const TextStyle(fontSize: 22.0, color: Palette.white),
          ),
          title != null
              ? Text(
                  "$title",
                  style: const TextStyle(fontSize: 22.0, color: Palette.white),
                )
              : Container(
                  child: SvgPicture.asset(
                    WeatherInfoAssetPath.fetchAssetFromTodayWeather(assetPath),
                    color: Colors.white,
                    height: 46.0.h,
                    width: 46.0,
                    fit: BoxFit.scaleDown,
                  ),
                  margin: EdgeInsets.only(right: 8.0.spMin),
                ),
          Text(
            trailing,
            style: TextStyle(fontSize: 22.0.sp, color: Palette.white),
          ),
        ],
      ),
    );
  }
}
