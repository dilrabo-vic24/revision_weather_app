import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:revision_weather_app/logic/weather_notifier.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Consumer<WeatherNotifier>(
            builder: (context, weatherNotifier, child) {
              return Column(
                children: [
                  customTextStyle(
                      text: weatherNotifier.weatherData.location?.region ?? ""),
                  customTextStyle(
                    text:
                        "Max: ${weatherNotifier.weatherData.forecast?.forecastday?[0].day?.maxtempC.toString()}°C   Min: ${weatherNotifier.weatherData.forecast?.forecastday![0].day?.maxtempC.toString()}°C",
                    fontSize: 15.sp,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
