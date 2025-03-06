import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
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
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return CirclePage(
            checkUnit: true,
            unit: "%",
            color1: Color(0xff5363F3),
            textParameter: state.humidity,
            color2: Color(0xff4BCFF9),
            located: 'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
            textAirQuality: '',
            textState: '',
          );
        },
      ),
    );
  }
}
