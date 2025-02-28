import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/circle_page.dart';

import '../component/visibility_switch.dart';

class VisibilityView extends StatefulWidget {
  const VisibilityView({super.key});

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  bool isMiles = false;
  double kmValue = 24.4;

  double _convertUnit(double kmValue) {
    final double value = isMiles ? kmValue * 0.001 : kmValue;
    return double.parse(value.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Visibility'),
      body: Column(
        children: [
          CirclePage(
            checkUnit: true,
            unit: isMiles ? "mi" : "km",
            color1: isMiles ? Color(0xffFF6F61) : Color(0xff5363F3),
            textParameter: _convertUnit(kmValue),
            color2: isMiles ? Color(0xffFF6F61) : Color(0xff4BCFF9),
            located: 'Hoài Đức, Hà Nội',
            textAirQuality: '',
            textState: '',
          ),
          VisibilityButton(
            onUnitChanged: (value) {
              setState(() {
                isMiles = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
