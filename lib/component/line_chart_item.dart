import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartItem extends StatefulWidget {
  const LineChartItem({super.key});

  @override
  State<LineChartItem> createState() => _LineChartItemState();
}

class _LineChartItemState extends State<LineChartItem> {
  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;
  late CrosshairBehavior _crossHairBehavior;

  List<_SalesData> data = [
    _SalesData(1, 35),
    _SalesData(2, 28),
    _SalesData(3, 34),
    _SalesData(4, 32),
    _SalesData(5, 40),
    _SalesData(6, 45),
    _SalesData(7, 38),
    _SalesData(8, 42),
    _SalesData(9, 50),
    _SalesData(10, 47),
    _SalesData(11, 39),
    _SalesData(12, 41),
    _SalesData(13, 37),
    _SalesData(14, 29),
    _SalesData(15, 36),
    _SalesData(16, 33),
    _SalesData(17, 41),
    _SalesData(18, 46),
    _SalesData(19, 39),
    _SalesData(20, 43),
    _SalesData(21, 51),
    _SalesData(22, 48),
    _SalesData(23, 40),
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(
        enable: true,
        format: 'point.x h : point.y',
      ),
      lineType: TrackballLineType.vertical,
      markerSettings: TrackballMarkerSettings(
        markerVisibility: TrackballVisibilityMode.visible,
      ),
      lineDashArray: [5, 5], // Dotted line effect
    );
    _crossHairBehavior = CrosshairBehavior(
      enable: true,
      lineType: CrosshairLineType.both,
      lineDashArray: [5, 5],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        minimum: 0,
        maximum: 24,
        interval: 6,
        majorTickLines: MajorTickLines(size: 6, color: Colors.black),
        majorGridLines: MajorGridLines(width: 1, dashArray: [5, 5]),
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(
            '${details.value.toInt()}h',
            TextStyle(color: Colors.black, fontSize: 12),
          );
        },
      ),
      primaryYAxis: NumericAxis(
        minimum: 20,
        maximum: 60,
        interval: 10,

        majorTickLines: MajorTickLines(size: 6, color: Colors.black),
        majorGridLines: MajorGridLines(width: 1, dashArray: [5, 5]),
      ),
      tooltipBehavior: _tooltipBehavior,
      trackballBehavior: _trackballBehavior,
      crosshairBehavior: _crossHairBehavior,
      series: <CartesianSeries<_SalesData, num>>[
        LineSeries<_SalesData, num>(
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          markerSettings: MarkerSettings(isVisible: true),
        ),
        AreaSeries<_SalesData, num>(
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.5), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final int year;
  final double sales;
}
