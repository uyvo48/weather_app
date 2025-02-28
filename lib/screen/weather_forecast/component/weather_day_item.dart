import 'package:flutter/material.dart';

class WeatherDayItem extends StatelessWidget {
  final String textDay;
  final double minTempCelsius; // Đổi tên và kiểu thành double
  final double maxTempCelsius;
  final String iconState;
  final String textStateWeatherForecast;
  final bool useFahrenheit; // Đổi tên biến

  const WeatherDayItem({
    super.key,
    required this.textDay,
    required this.minTempCelsius,
    required this.maxTempCelsius,
    required this.iconState,
    required this.textStateWeatherForecast,
    required this.useFahrenheit,
  });

  // Hiển thị nhiệt độ với đơn vị
  String getTemperatureText(double celsius) {
    if (useFahrenheit) {
      final fahrenheit = (celsius * 1.8 + 32).round();
      return '$fahrenheit°F'; // Dạng "77°F"
    } else {
      return '${celsius.round()}°C'; // Dạng "25°C"
    }
  }

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
                getTemperatureText(minTempCelsius),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 4),
              Text(
                getTemperatureText(maxTempCelsius),
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
