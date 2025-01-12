import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class TodayWidget extends StatelessWidget {
  final String text;
  const TodayWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customTextStyle(text: "Today"),
          customTextStyle(
            text: text,
          ),
        ],
      ),
    );
  }
}