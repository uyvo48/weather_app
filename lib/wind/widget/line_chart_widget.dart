import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key}); // Thêm key nếu cần

  final List<Color> gradientColors = const [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      titlesData: LineTitles.getTitleData(),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine:
            (value) => const FlLine(color: Color(0xff37434d), strokeWidth: 1),
        drawVerticalLine: true,
        getDrawingVerticalLine:
            (value) => const FlLine(color: Color(0xff37434d), strokeWidth: 1),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 2.5),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Color(0xff23b6e6),
          barWidth: 5,
          belowBarData: BarAreaData(show: true, color: Color(0xff23b6e6)),
        ),
      ],
    ),
  );
}
