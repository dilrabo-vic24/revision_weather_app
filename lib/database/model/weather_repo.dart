import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:revision_weather_app/database/model/weather_model.dart';
import 'package:revision_weather_app/presentation/utils/network_constans.dart';

class WeatherRepo {
  Future<WeatherModel> getWeatherByCityName({
    required String cityName,
  }) async {
    final url = Uri.parse(
      "${NetworkConstants.baseUrl}/v1/forecast.json?key=${NetworkConstants.apiKey}&q=$cityName&days=7",
    );
    final response = await http.get(url);
    log("res ${response.statusCode}");
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      WeatherModel weather = WeatherModel.fromJson(body);
      return weather;
    } else {
      Exception("Error while getting data");
    }
    throw Exception("Unknowing error");
  }
}
