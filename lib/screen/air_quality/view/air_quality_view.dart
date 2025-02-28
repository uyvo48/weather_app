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
Color unhealthyForSensitiveColor1 = Color(0xffB53600);
Color unhealthyForSensitiveColor2 = Color(0xffFF7E00);
Color unHealthyColor1 = Color(0xffA00000);
Color unHealthyColor2 = Color(0xffD94F4F);
Color veryUnHealthyColor1 = Color(0xff6B0076);
Color veryUnHealthyColor2 = Color(0xffAE55B7);
Color maroonColor1 = Color(0xff7B0E2C);
Color maroonColor2 = Color(0xffC92251);

class _AirQualityViewState extends State<AirQualityView> {
  double textParameter = 400; // Giá trị AQI

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
    } else if (textParameter > 51 && textParameter <= 100) {
      color1 = unhealthyForSensitiveColor1;
      color2 = unhealthyForSensitiveColor2;
      textAirQuality = 'High';
      textState = 'Unhealthy for Sensitive Groups ';
    } else if (textParameter > 101 && textParameter <= 200) {
      color1 = unHealthyColor1;
      color2 = unHealthyColor2;
      textAirQuality = 'High';
      textState = 'Unhealthy';
    } else if (textParameter > 201 && textParameter <= 300) {
      color1 = veryUnHealthyColor1;
      color2 = veryUnHealthyColor2;
      textAirQuality = 'Very Unhealthy';
      textState = 'Very Unhealthy';
    } else {
      color1 = unHealthyColor1;
      color2 = unHealthyColor2;
      textAirQuality = 'Hazardous';
      textState = 'maroon';
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
