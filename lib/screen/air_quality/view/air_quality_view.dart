import 'package:flutter/material.dart';

import '../../../component/app_bar_setting_item.dart';
import '../../../component/circle_page.dart';

class AirQualityView extends StatefulWidget {
  const AirQualityView({super.key});

  @override
  State<AirQualityView> createState() => _AirQualityViewState();
}

Color goodColor1 = Color(0xff038603);
Color goodColor2 = Color(0xff0EE400);
Color moderateColor1 = Color(0xffB18B01);
Color moderateColor2 = Color(0xffFFFF00);
Color unhealthyColor1 = Color(0xffB53600);
Color unhealthyColor2 = Color(0xffFF7EFF);

class _AirQualityViewState extends State<AirQualityView> {
  double textParameter = 51; // Giá trị AQI

  @override
  Widget build(BuildContext context) {
    // Tính toán 4 thông số trong build
    Color color1;
    Color color2;
    String textAirQuality;
    String textState;

    if (textParameter > 0 && textParameter <= 50) {
      color1 = goodColor1;
      color2 = goodColor2;
      textAirQuality = 'Low';
      textState = 'Good';
    } else if (textParameter > 50 && textParameter <= 100) {
      color1 = moderateColor1;
      color2 = moderateColor2;
      textAirQuality = 'Moderate';
      textState = 'Moderate';
    } else {
      color1 = unhealthyColor1;
      color2 = unhealthyColor2;
      textAirQuality = 'High';
      textState = 'Unhealthy';
    }

    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Hoài Đức'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
            unit: "",
            textParameter: textParameter,
            color1: color1,
            color2: color2,
            located: 'Hoài Đức, Hà Nội',
            textAirQuality: textAirQuality,
            textState: textState,
            checkUnit: false,
          ),
        ],
      ),
    );
  }
}
