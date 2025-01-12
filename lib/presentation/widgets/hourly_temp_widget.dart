import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class HourlyTempWidget extends StatelessWidget {
  final String hourlyTemp;
  final String hourlyTempIcon;
  final String hour;
  const HourlyTempWidget({
    super.key,
    required this.hourlyTemp,
    required this.hourlyTempIcon,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            customTextStyle(
              text: hourlyTemp,
              fontSize: 19.sp,
            ),
            Image.network(
              hourlyTempIcon,
            ),
            customTextStyle(
              text: hour,
            ),
          ],
        ),
        SizedBox(width: 7.w),
      ],
    );
  }
}
