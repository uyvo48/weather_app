import 'package:flutter/material.dart';

import '../component/button_weather_forecast.dart';

class WeatherForecastView extends StatefulWidget {
  const WeatherForecastView({super.key});

  @override
  State<WeatherForecastView> createState() => _WeatherForecastViewState();
}

class _WeatherForecastViewState extends State<WeatherForecastView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: null,
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
        ),
        title: Text(
          'Language',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [Container(width: 100, child: ButtonWeatherForecast())],

        // actions: [ButtonWeatherForecast()],
      ),
    );
  }
}
