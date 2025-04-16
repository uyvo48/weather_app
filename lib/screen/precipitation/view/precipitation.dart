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

List<FlSpot> _convertToFlSpots(List<String> times, List<num> snowFall) {
  // Lấy tối đa 12 điểm dữ liệu gần nhất
  final int startIndex = times.length > 12 ? times.length - 12 : 0;
  final recentTimes = times.sublist(startIndex);
  final recentPrecipitation = snowFall.sublist(startIndex);

  return List.generate(recentTimes.length, (i) {
    final dateTime = DateTime.parse(recentTimes[i]);
    final hour = dateTime.hour + dateTime.minute / 60.0;
    return FlSpot(hour, recentPrecipitation[i].toDouble());
  });
}

class PrecipitationViewState extends State<PrecipitationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Precipitation'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final hourly = state.weather!.hourly!;
            final listPrecipitation = _convertToFlSpots(hourly.time, hourly.precipitationProbability);
            final latestTime =
            hourly.time.isNotEmpty
                ? hourly.time.last.substring(11, 16)
                : 'N/A';
            final lastPrecipitation =
            hourly.precipitationProbability.isNotEmpty
                ? '${hourly.precipitationProbability.last} ${state.weather!.hourlyUnits!.precipitationProbability}'
                : 'N/A';
            return Column(
              children: [
                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return DiagramScreen(
                      textvalue: lastPrecipitation,
                      located:
                      'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                      time: latestTime ,
                      textunit: 'cm',
                    );
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: CustomLineChart(
                    data: listPrecipitation,
                    unit: 'h',
                    interval: 1,
                    colorStart: Color(0xff11998E).withOpacity(0.6),
                    colorEnd: Color(0xff38EF7D).withOpacity(0.5),
                    lineColorStart: Color(0xff38EF7D),
                    lineColorEnd: Color(0xff11998E),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
