import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/circle_page.dart';

import '../../../component/app_bar_setting_item.dart';

class UvIndexView extends StatefulWidget {
  const UvIndexView({super.key});

  @override
  State<UvIndexView> createState() => _UvIndexViewState();
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

class _UvIndexViewState extends State<UvIndexView> {
  double textParameter = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color1;
    Color color2;
    String textAirQuality;
    String textState;

    if (textParameter >= 0 && textParameter <= 2) {
      color1 = goodColor1;
      color2 = goodColor2;
      textAirQuality = 'Low';
      textState = 'Good';
    } else if (textParameter > 2 && textParameter <= 5) {
      color1 = moderateColor1;
      color2 = moderateColor2;
      textAirQuality = 'Moderate';
      textState = 'Moderate';
    } else if (textParameter > 5 && textParameter <= 7) {
      color1 = unhealthyForSensitiveColor1;
      color2 = unhealthyForSensitiveColor2;
      textAirQuality = 'High';
      textState = 'Unhealthy for Sensitive Groups';
    } else if (textParameter > 7 && textParameter <= 10) {
      color1 = unHealthyColor1;
      color2 = unHealthyColor2;
      textAirQuality = 'Very High';
      textState = 'Unhealthy';
    } else if (textParameter > 10) {
      color1 = veryUnHealthyColor1;
      color2 = veryUnHealthyColor2;
      textAirQuality = 'Extreme';
      textState = 'Very Unhealthy';
    } else {
      color1 = maroonColor1;
      color2 = maroonColor2;
      textAirQuality = 'Unknown';
      textState = 'N/A';
    }

    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'UV Index'),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Center(
            child: CirclePage(
              unit: "",
              textParameter: textParameter,
              color1: color1,
              color2: color2,
              located: 'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
              // Tọa độ từ API
              textAirQuality: textAirQuality,
              textState: textState,
              checkUnit: false,
            ),
          );
        },
      ),
    );
  }
}
