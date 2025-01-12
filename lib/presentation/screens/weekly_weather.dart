import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:revision_weather_app/logic/weather_notifier.dart';
import 'package:revision_weather_app/presentation/utils/custom_text_style.dart';
import 'package:revision_weather_app/presentation/widgets/air_quality_widget.dart';
import 'package:revision_weather_app/presentation/widgets/daily_tem_widget.dart';
import 'package:revision_weather_app/presentation/widgets/sunrise_and_sunset.dart';
import 'package:revision_weather_app/presentation/widgets/uv_index.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360.w,
        height: 690.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 1, 36, 65),
              Color.fromARGB(255, 1, 61, 110),
              Color.fromARGB(255, 1, 72, 131),
              Color.fromARGB(255, 102, 2, 120),
            ],
          ),
        ),
        child: Consumer<WeatherNotifier>(
          builder: (context, weatherNotifier, child) {
            final data = weatherNotifier.weatherData.forecast!.forecastday;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Center(
                  child: customTextStyle(
                    text: weatherNotifier.weatherData.location?.name ?? "",
                    fontSize: 28.sp,
                  ),
                ),
                Center(
                  child: customTextStyle(
                    text:
                        "Max: ${data?[0].day?.maxtempC.toString()}°C   Min: ${data?[0].day?.maxtempC.toString()}°C",
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: customTextStyle(
                    text: "7-Days Forecasts",
                    fontSize: 33.sp,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 150.h,
                      width: 300.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return DailyTemWidget(
                            dailyTemp: weatherNotifier.weatherData.forecast!
                                .forecastday![index].day!.avgtempC
                                .toString(),
                            dailyTempIcon:
                                "https:${data![index].day!.condition!.icon}",
                            day: weatherNotifier.getWeekdayName(
                              dateStr: data[index].date.toString(),
                            ),
                          );
                        },
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                const AirQualityWidget(),
                Row(
                  children: [
                    SunriseAndSunset(
                      sunriseTime: data![0].astro!.sunrise.toString(),
                      sunsetTime: data[0].astro!.sunset.toString(),
                    ),
                    UvIndex(uvIndex: data[0].day!.uv.toString()),
                  ],
                ),
                const Spacer(),
                Center(
                    child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 50.w,
                    color: Colors.white,
                  ),
                )),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
