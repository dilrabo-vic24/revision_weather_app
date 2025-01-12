import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:revision_weather_app/logic/weather_notifier.dart';
import 'package:revision_weather_app/presentation/screens/weekly_weather.dart';
import 'package:revision_weather_app/presentation/utils/app_colors.dart';
import 'package:revision_weather_app/presentation/utils/app_images.dart';
import 'package:revision_weather_app/presentation/widgets/hourly_temp_widget.dart';
import 'package:revision_weather_app/presentation/widgets/main_weather_widget.dart';
import 'package:revision_weather_app/presentation/widgets/today_widget.dart';

class TodayWeatherScreen extends StatefulWidget {
  final String cityName;
  const TodayWeatherScreen({super.key, required this.cityName});

  @override
  State<TodayWeatherScreen> createState() => _TodayWeatherScreenState();
}

class _TodayWeatherScreenState extends State<TodayWeatherScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherNotifier>(context, listen: false)
        .getWeather(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 1, 36, 65),
              Color.fromARGB(255, 1, 61, 110),
              Color.fromARGB(255, 1, 72, 131),
              Color.fromARGB(255, 102, 2, 120)
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const MainWeatherWidget(),
              Image.asset(AppImages.houseImage),
              Consumer<WeatherNotifier>(
                builder: (context, weatherNotifier, child) {
                  final hourlyData =
                      weatherNotifier.weatherData.forecast?.forecastday![2];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 1, 36, 65),
                          Color.fromARGB(255, 102, 2, 120),
                          AppColors.endColor,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        TodayWidget(
                          text: weatherNotifier.findMonth(
                                dataTime: weatherNotifier
                                        .weatherData.location?.localtime ??
                                    "",
                              ) ??
                              "",
                        ),
                        const Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: SizedBox(
                            height: 120.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return HourlyTempWidget(
                                  hourlyTemp:
                                      "${hourlyData?.hour?[index + 15].tempC.toString()}°C",
                                  hourlyTempIcon:
                                      "https:${hourlyData?.hour?[index + 15].condition?.icon}",
                                  hour:
                                      "${hourlyData?.hour?[index + 15].time?.substring(11)}",
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.endColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WeeklyWeather(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}
