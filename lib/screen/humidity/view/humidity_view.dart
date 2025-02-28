import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/circle_page.dart';

class HumidityView extends StatefulWidget {
  const HumidityView({super.key});

  @override
  State<HumidityView> createState() => _HumidityViewState();
}

class _HumidityViewState extends State<HumidityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Humidity'),
      body: CirclePage(
        checkUnit: false,
        unit: "",
        color1: Color(0xff5363F3),
        textParameter: 100,
        color2: Color(0xff4BCFF9),
        located: 'Hoài Đức, Hà Nội',
        textAirQuality: '',
        textState: '',
      ),
    );
  }
}
