import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import '../../../component/custom_line_chart.dart';
import '../../../component/diagram_creen.dart';

class PrecipitationView extends StatefulWidget {
  const PrecipitationView({super.key});
  @override
  State<PrecipitationView> createState() => PrecipitationViewState();
}

class PrecipitationViewState extends State<PrecipitationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Precipitation'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return DiagramScreen(
                  textvalue: '4.5',
                  located:
                      'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                  time: '17:50',
                  textunit: 'cm',
                );
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: CustomLineChart(
                data: [
                  FlSpot(0, 0),
                  FlSpot(1, 2),
                  FlSpot(2, 10),
                  FlSpot(3, 7),
                  FlSpot(4, 1),
                  FlSpot(5, 1),
                  FlSpot(10, 2),
                ],
                unit: 'h',
                interval: 1,
                colorStart: Color(0xff11998E).withOpacity(0.6),
                colorEnd: Color(0xff38EF7D).withOpacity(0.5),
                lineColorStart: Color(0xff38EF7D),
                lineColorEnd: Color(0xff11998E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
