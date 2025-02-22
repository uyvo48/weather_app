import 'package:flutter/material.dart';

class WeatherDayItem extends StatelessWidget {
  final String textDay;
  final String minTemperature;
  final String maxTemperature;
  final String iconState;
  final String textStateWeatherForecast;
  const WeatherDayItem({
    super.key,
    required this.textDay,
    required this.minTemperature,
    required this.maxTemperature,
    required this.iconState,
    required this.textStateWeatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 54),
      height: 49,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000514).withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textDay,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              Text(
                minTemperature,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(
                maxTemperature,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),

          Row(
            children: [
              Image.asset(iconState),
              Text(
                textStateWeatherForecast,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff12203A).withOpacity(0.54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
