import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class SunriseAndSunset extends StatelessWidget {
  final String sunriseTime;
  final String sunsetTime;
  const SunriseAndSunset({
    super.key,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 130.h,
      margin: EdgeInsets.only(
        left: 20.w,
        top: 10.h,
      ),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        border: Border.all(color: Colors.white),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF3E2D8F),
            Color(0xFF8E78C8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny,
                color: Colors.white,
              ),
              SizedBox(width: 5.w),
              customTextStyle(
                text: "SUNRISE",
                fontSize: 16.sp,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          customTextStyle(
            text: sunriseTime,
            fontSize: 28.sp,
          ),
          SizedBox(height: 15.h),
          customTextStyle(
            text: "SUNSET: $sunsetTime",
            fontSize: 17.sp,
          ),
          SizedBox(height: 6.h),
        
        ],
      ),
    );
  }
}
