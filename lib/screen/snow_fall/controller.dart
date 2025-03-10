import 'package:flutter/material.dart';

import '../../model/chart_data.dart';

class SnowFallController {
  final List<ChartData> listChartData = [
    ChartData('00h', 0, Colors.red),
    ChartData('06h', 1.3, Colors.green),
    ChartData('12h', 1.5, Colors.blue),
    ChartData('18h', 2, Colors.pink),
    ChartData('24h', 2.3, Colors.black),
  ];
}
