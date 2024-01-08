import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

Future<Map<String, dynamic>> getCurrentWeather() async {
  try {
    String cityName = 'Mexico+city';
    final res = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=$openWeatherAPIKey'),
    );
    final data = jsonDecode(res.body);
    if (data['cod'] != '200') {
      throw 'An unexpected error occurred';
    }
    return data;
  } catch (e) {
    throw e.toString();
  }
}
