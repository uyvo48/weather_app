import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/circle_page.dart';

import '../../../app_bloc/app_event.dart';
import '../../../component/app_bar_setting_item.dart';
import '../../../util/color.dart';

class UvIndexView extends StatefulWidget {
  const UvIndexView({super.key});

  @override
  State<UvIndexView> createState() => _UvIndexViewState();
}

class _UvIndexViewState extends State<UvIndexView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(SetUvIndexMax());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'UV Index'),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final double uvIndex = state.uvIndexMax;
          Color color1;
          Color color2;
          String textAirQuality;
          String textState;

          if (uvIndex >= 0 && uvIndex <= 2) {
            color1 = goodColor1;
            color2 = goodColor2;
            textAirQuality = 'Low';
            textState = 'Good';
          } else if (uvIndex > 2 && uvIndex <= 5) {
            color1 = moderateColor1;
            color2 = moderateColor2;
            textAirQuality = 'Moderate';
            textState = 'Moderate';
          } else if (uvIndex > 5 && uvIndex <= 7) {
            color1 = unhealthyForSensitiveColor1;
            color2 = unhealthyForSensitiveColor2;
            textAirQuality = 'High';
            textState = 'Unhealthy for Sensitive Groups';
          } else if (uvIndex > 7 && uvIndex <= 10) {
            color1 = unHealthyColor1;
            color2 = unHealthyColor2;
            textAirQuality = 'Very High';
            textState = 'Unhealthy';
          } else if (uvIndex > 10) {
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
