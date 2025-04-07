import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/custom_line_chart.dart';

import '../../../util/images.dart';

class SnowFallView extends StatefulWidget {
  const SnowFallView({super.key});

  @override
  SnowFallViewState createState() {
    return SnowFallViewState();
  }
}

class SnowFallViewState extends State<SnowFallView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Snow Fall'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconLocation),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Text(
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  );
                },
              ),
            ],
          ),
          Text(
            '17:50',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff89909D),
            ),
          ),
          Text(
            '10.0 km ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 360,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                interval: 2,
                colorStart: Color(0xffFDC830).withAlpha(5),
                colorEnd: Color(0xffF37335).withOpacity(0.6),
                lineColorStart: Color(0xffFDC830),
                lineColorEnd: Color(0xffF37335),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
