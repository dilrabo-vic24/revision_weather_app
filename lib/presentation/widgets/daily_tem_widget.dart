import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class DailyTemWidget extends StatelessWidget {
  final String dailyTemp;
  final String dailyTempIcon;
  final String day;
  const DailyTemWidget({
    super.key,
    required this.dailyTemp,
    required this.dailyTempIcon,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.r),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3E2D8F),
            Color(0xFF8E78C8),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextStyle(
            text: dailyTemp,
            fontSize: 22.sp,
          ),
          Image.network(
            dailyTempIcon,
          ),
          customTextStyle(
            text: day,
            fontSize: 22.sp,
          ),
        ],
      ),
    );
  }
}
