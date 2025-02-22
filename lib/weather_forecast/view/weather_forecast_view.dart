import 'package:flutter/material.dart';
import 'package:weather_app/util/images.dart';

import '../component/button_weather_forecast.dart';
import '../component/weather_day_item.dart';

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
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            width: 100,
            child: ButtonWeatherForecast(),
          ),
        ],

        // actions: [ButtonWeatherForecast()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(iconMapWorld),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(iconLocation),
                      Text('New York, USA'),
                    ],
                  ),
                  Image.asset(
                    iconSun,
                    height: 105,
                    width: 105,
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    '25°c',
                    style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Feel like 28°c',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff12203A).withOpacity(0.54),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Another 7 days',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeatherDayItem(
                    textDay: 'Mon',
                    minTemperature: '25°',
                    maxTemperature: '28°',
                    iconState: iconSun,
                    textStateWeatherForecast: 'rain',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
