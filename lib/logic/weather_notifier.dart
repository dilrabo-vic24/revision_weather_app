import 'package:flutter/material.dart';
import 'package:revision_weather_app/database/model/weather_model.dart';
import 'package:revision_weather_app/database/model/weather_repo.dart';

class WeatherNotifier extends ChangeNotifier {
  final WeatherRepo weatherRepo;

  WeatherModel weatherData = WeatherModel();

  WeatherNotifier({required this.weatherRepo});

  Future<void> getWeather({required String cityName}) async {
    final body = await weatherRepo.getWeatherByCityName(cityName: cityName);

    weatherData = body;

    notifyListeners();
  }

  String? findMonth({required String dataTime}) {
    String dateTime = "2025-01-10 15:28";

    String monthNumber = dateTime.substring(5, 7);
    String day = dateTime.substring(8, 10);

    Map<String, String> monthNames = {
      "01": "Jan",
      "02": "Feb",
      "03": "Mar",
      "04": "Apr",
      "05": "May",
      "06": "Jun",
      "07": "Jul",
      "08": "Aug",
      "09": "Sep",
      "10": "Oct",
      "11": "Nov",
      "12": "Dec",
    };

    String? monthName = monthNames[monthNumber];
    return "$monthName, $day";
  }

  String getWeekdayName({required String dateStr}) {
    DateTime date = DateTime.parse(dateStr);

    List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return weekdays[date.weekday - 1];
  }
}
