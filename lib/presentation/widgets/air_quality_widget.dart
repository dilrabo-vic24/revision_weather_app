import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';
import 'package:revision_weather_app/presentation/widgets/custom_divider.dart';

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
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
                Icons.gps_fixed,
                color: Colors.white,
              ),
              customTextStyle(
                text: "AIR QUALITY",
              ),
            ],
          ),
          SizedBox(height: 7.h),
          customTextStyle(
            text: "3-Low Health Risk",
            fontSize: 28.sp,
          ),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextStyle(
                text: "See more",
                fontSize: 18.sp,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 25.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}
