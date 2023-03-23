import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/modules/shared/utils/assets.dart';
import 'package:weather_app/modules/shared/utils/color.dart';

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
      this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0.sm, right: 12.0.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: TextStyle(fontSize: 22.0.sp, color: Palette.white),
          ),
          title != null
              ? Text(
                  "$title",
                  style: TextStyle(fontSize: 22.0.sp, color: Palette.white),
                )
              : Container(
                  child: SvgPicture.asset(
                    Assets.sunny,
                    color: Colors.white,
                    height: 46.0.h,
                    width: 46.0.h,
                    fit: BoxFit.scaleDown,
                  ),
                  margin: EdgeInsets.only(right: 8.0.sm),
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
