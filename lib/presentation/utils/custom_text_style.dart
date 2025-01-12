import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextStyle({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? 20.sp,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}
