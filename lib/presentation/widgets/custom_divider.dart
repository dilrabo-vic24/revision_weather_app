import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 4.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF362A84),
            Color(0xff805bca),
            Color(0xFFBD08FC),
          ],
        ),
      ),
    );
  }
}
