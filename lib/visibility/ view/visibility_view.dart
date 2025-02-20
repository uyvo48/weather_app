import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/circle_page.dart';

class VisibilityView extends StatefulWidget {
  const VisibilityView({super.key});

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Visibility'),
      body: CirclePage(
        color1: Color(0xff5363F3),
        textParameter:
            "24,14 \n"
            "   km",
        color2: Color(0xff4BCFF9),
        located: 'Hoài Đức, Hà Nội',
        textAirQuality: '',
        textState: '',
      ),
    );
  }
}
