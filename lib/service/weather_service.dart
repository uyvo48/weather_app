import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather.dart';

class WeatherService {
  Future<Weather> fetchAllItems({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_min,temperature_2m_max,wind_speed_10m_max,uv_index_max&hourly=temperature_2m,snowfall,wind_speed_10m,visibility,weather_code,precipitation,relative_humidity_2m&current=relative_humidity_2m,temperature_2m,wind_speed_10m',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(response.body);
      Weather weather = Weather.fromJson(jsonData);
      print(weather.hourly?.visibility.toString());
      print('Visibility data: ${weather.hourly!.visibility.last}');
      print('humidity ${weather.hourly!.relativeHumidity2M.last}');
      return weather;
    } else {
      print(
        'API Error: Status Code ${response.statusCode}, Body: ${response.body}',
      );
      throw Exception('Failed to load items: ${response.statusCode}');
    }
  }
}
