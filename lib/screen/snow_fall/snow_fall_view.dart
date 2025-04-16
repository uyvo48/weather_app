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

  List<FlSpot> _convertToFlSpots(List<String> times, List<num> snowFall) {
    // Lấy tối đa 12 điểm dữ liệu gần nhất
    final int startIndex = times.length > 12 ? times.length - 12 : 0;
    final recentTimes = times.sublist(startIndex);
    final recentSnowFall = snowFall.sublist(startIndex);

    return List.generate(recentTimes.length, (i) {
      final dateTime = DateTime.parse(recentTimes[i]);
      final hour = dateTime.hour + dateTime.minute / 60.0;
      return FlSpot(hour, recentSnowFall[i].toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Snow Fall'),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {

          final hourly = state.weather!.hourly!;
          final listSnowfall = _convertToFlSpots(hourly.time, hourly.snowfall);
          final latestTime =
          hourly.time.isNotEmpty
              ? hourly.time.last.substring(11, 16)
              : 'N/A';
          final lastSnowFAll =
          hourly.snowfall.isNotEmpty
              ? '${hourly.snowfall.last} ${state.weather!.hourlyUnits!.snowfall}'
              : 'N/A';
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconLocation),
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      return Text(
                        'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 14),
                      );
                    },
                  ),
                ],
              ),
              Text(
                latestTime,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff89909D),
                ),
              ),
              Text(
                "$lastSnowFAll Cm",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 360,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLineChart(
                    data:listSnowfall,
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
          );
        },
      ),
    );
  }
}
