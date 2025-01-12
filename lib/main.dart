import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:revision_weather_app/database/model/weather_repo.dart';
import 'package:revision_weather_app/logic/weather_notifier.dart';
import 'package:revision_weather_app/presentation/screens/get_started_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherNotifier(
            weatherRepo: WeatherRepo(),
          ),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: const GetStartedScreen(),
      ),
    );
  }
}
