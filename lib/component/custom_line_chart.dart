import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  final List<FlSpot> data;
  final String unit;
  final double interval;
  final Color colorStart;
  final Color colorEnd;
  final Color lineColorStart;
  final Color lineColorEnd;
  const CustomLineChart({
    super.key,
    required this.data,
    required this.unit,
    required this.interval,
    required this.colorStart,
    required this.colorEnd,
    required this.lineColorStart,
    required this.lineColorEnd,
  });

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: LineChart(
          LineChartData(
            titlesData: _buildTitlesData(),
            borderData: _buildBorderData(),
            lineBarsData: [_lineBarSpot()],
            gridData: _buildGridData(),
          ),
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          maxIncluded: true,
          minIncluded: true,
          interval: 2,
          getTitlesWidget: (value, meta) {
            return Text(
              value < 10
                  ? "0 ${value.toInt()} ${widget.unit}"
                  : " ${value.toInt()} ${widget.unit}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff12203A).withOpacity(0.5),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 2,
          getTitlesWidget: (value, meta) {
            return Text(
              "${value.toInt()} ",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff12203A).withOpacity(0.5),
              ),
            );
          },
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(show: false);
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawHorizontalLine: false,
      drawVerticalLine: true,
    );
  }

  LineChartBarData _lineBarSpot() {
    return LineChartBarData(
      gradient: LinearGradient(
        colors: [widget.lineColorEnd, widget.lineColorEnd],
      ),
      show: true,
      spots: widget.data,
      isCurved: true,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [widget.colorStart, widget.colorEnd],
        ),
      ),
    );
  }
}
