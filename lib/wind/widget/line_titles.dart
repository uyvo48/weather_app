import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static final TextStyle bottomTitleStyle = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static final TextStyle leftTitleStyle = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static FlTitlesData getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 2:
              return Text('MAR', style: bottomTitleStyle);
            case 5:
              return Text('JUN', style: bottomTitleStyle);
            case 8:
              return Text('SEP', style: bottomTitleStyle);
          }
          return Text('');
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 1:
              return Text('10k', style: leftTitleStyle);
            case 3:
              return Text('30k', style: leftTitleStyle);
            case 5:
              return Text('50k', style: leftTitleStyle);
          }
          return Text('');
        },
      ),
    ),
  );
}
