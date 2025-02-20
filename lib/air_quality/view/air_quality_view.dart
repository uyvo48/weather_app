import 'package:flutter/material.dart';

import '../../component/app_bar_setting_item.dart';
import '../../component/circle_page.dart';

class AirQualityView extends StatefulWidget {
  const AirQualityView({super.key});

  @override
  State<AirQualityView> createState() => _AirQualityViewState();
}

class _AirQualityViewState extends State<AirQualityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Hoài Đức'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
            textParameter: '0,85',
            color1: Color(0xff038603),
            color2: Color(0xff00E400),
            located: 'Hoài Đức, Hà Nội',
            textAirQuality: 'Low',
            textState: 'Good',
          ),
        ],
      ),
    );
  }
}
