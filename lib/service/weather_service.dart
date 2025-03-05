import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather.dart';

class WeatherService {
  Future<Weather> fetchAllItems({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=relative_humidity_2m,snowfall,weather_code,visibility&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,wind_speed_10m_max',
    );
    print('Requesting URL: $url'); // In URL để kiểm tra
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(response.body);
      Weather weather = Weather.fromJson(jsonData);
      print(weather.hourly?.visibility.toString());
      print('Visibility data: ${weather.hourly!.visibility.last}');
      return Weather.fromJson(jsonData);
    } else {
      print(
        'API Error: Status Code ${response.statusCode}, Body: ${response.body}',
      );
      throw Exception('Failed to load items: ${response.statusCode}');
    }
  }
}
