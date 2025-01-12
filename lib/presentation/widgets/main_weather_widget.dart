import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:revision_weather_app/logic/weather_notifier.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherNotifier>(
      builder: (context, weatherNotifier, child) {
        String icon =
            "https:${weatherNotifier.weatherData.current?.condition?.icon}";

        return Column(
          children: [
            Image.network(
              icon,
              width: 200.w,
              height: 200.h,
              fit: BoxFit.cover,
            ),
            customTextStyle(
              text:
                  "${weatherNotifier.weatherData.current?.tempC.toString()}° C",
              fontSize: 30.sp,
            ),
            customTextStyle(
              text: "${weatherNotifier.weatherData.current?.condition?.text}",
              fontSize: 20.sp,
            ),
            customTextStyle(
              text:
                  "Max: ${weatherNotifier.weatherData.forecast?.forecastday?[0].day?.maxtempC.toString()}°C   Min: ${weatherNotifier.weatherData.forecast?.forecastday![0].day?.maxtempC.toString()}°C",
              fontSize: 20.sp,
            )
          ],
        );
      },
    );
  }
}
