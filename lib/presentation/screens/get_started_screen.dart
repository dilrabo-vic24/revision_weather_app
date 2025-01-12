import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision_weather_app/presentation/screens/weather_screen.dart';
import 'package:revision_weather_app/presentation/utils/app_images.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController placeController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 360.w,
          height: 690.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 36, 65),
                Color.fromARGB(255, 1, 61, 110),
                Color.fromARGB(255, 1, 72, 131),
                Color.fromARGB(255, 102, 2, 120)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Image.asset(AppImages.mainImage, width: 300.w, height: 300.h),
                Text(
                  ' Weather\nForeCasts',
                  style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextField(
                  controller: placeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter place",
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        fixedSize: Size(250.w, 50.h)),
                    onPressed: () {
                      if (placeController.text.trim().isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherScreen(
                              cityName: placeController.text.trim(),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: customTextStyle(
                              text: "Please enter place",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Get Start',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 1, 36, 65),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
