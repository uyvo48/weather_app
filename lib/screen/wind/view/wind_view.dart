import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/custom_line_chart.dart';

import '../../../util/images.dart';

class WindView extends StatefulWidget {
  const WindView({super.key});

  @override
  WindViewState createState() => WindViewState();
}

class WindViewState extends State<WindView> {
  @override
  void initState() {
    super.initState();
  }

  // Hàm chuyển đổi dữ liệu thời gian và tốc độ gió thành List<FlSpot>, sử dụng giờ thực tế
  List<FlSpot> _convertToFlSpots(List<String> times, List<num> windSpeeds) {
    // Lấy tối đa 12 điểm dữ liệu gần nhất
    final int startIndex = times.length > 12 ? times.length - 12 : 0;
    final recentTimes = times.sublist(startIndex);
    final recentWindSpeeds = windSpeeds.sublist(startIndex);

    return List.generate(recentTimes.length, (i) {
      final dateTime = DateTime.parse(recentTimes[i]);
      final hour = dateTime.hour + dateTime.minute / 60.0;
      return FlSpot(hour, recentWindSpeeds[i].toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Wind Speed'),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.weather?.hourly == null) {
            return const Center(child: Text('No wind data available'));
          }

          final hourly = state.weather!.hourly!;
          final windSpots = _convertToFlSpots(hourly.time, hourly.windSpeed10M);
          final latestTime =
              hourly.time.isNotEmpty
                  ? hourly.time.last.substring(11, 16)
                  : 'N/A';
          final latestWindSpeed =
              hourly.windSpeed10M.isNotEmpty
                  ? '${hourly.windSpeed10M.last} ${state.weather!.hourlyUnits!.windSpeed10M}'
                  : 'N/A';

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconLocation),
                  Text(
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
              Text(
                latestTime, // Hiển thị thời gian mới nhất
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff12203A).withOpacity(0.5),
                ),
              ),
              Text(
                latestWindSpeed, // Hiển thị tốc độ gió mới nhất
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 360,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLineChart(
                    data: windSpots,
                    // Dữ liệu với thời gian thực tế
                    unit: 'h',
                    // Không cần đơn vị vì hiển thị giờ thực tế
                    interval: 2,
                    // Khoảng cách nhãn trục X (2 giờ)
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
