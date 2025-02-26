import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import '../../util/images.dart';
import '../model/line_chart_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;
  late CrosshairBehavior _crossHairBehavior;

  List<LineChart> data = [
    LineChart(1, 35),
    LineChart(2, 28),
    LineChart(3, 34),
    // _SalesData(4, 32),
    // _SalesData(5, 40),
    // _SalesData(6, 45),
    // _SalesData(7, 38),
    // _SalesData(8, 42),
    // _SalesData(9, 50),
    // _SalesData(10, 47),
    // _SalesData(11, 39),
    // _SalesData(12, 41),
    // _SalesData(13, 37),
    // _SalesData(14, 29),
    // _SalesData(15, 36),
    // _SalesData(16, 33),
    // _SalesData(17, 41),
    // _SalesData(18, 46),
    // _SalesData(19, 39),
    // _SalesData(20, 43),
    // _SalesData(21, 51),
    // _SalesData(22, 48),
    // _SalesData(23, 40),
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(enable: true),
      lineType: TrackballLineType.vertical,
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
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Wind'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconLocation),
              Text(
                'Hoài Đức, Hà Nội',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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
            '10.0 km se',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SfCartesianChart(
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
                series: <CartesianSeries<LineChart, num>>[
                  LineSeries<LineChart, num>(
                    dataSource: data,
                    xValueMapper: (LineChart sales, _) => sales.year,
                    yValueMapper: (LineChart sales, _) => sales.sales,
                    // hiển thị thông soo trên đường line
                    // dataLabelSettings: DataLabelSettings(isVisible: true),
                    // markerSettings: MarkerSettings(isVisible: true),
                  ),
                  AreaSeries<LineChart, num>(
                    dataSource: data,
                    xValueMapper: (LineChart sales, _) => sales.year,
                    yValueMapper: (LineChart sales, _) => sales.sales,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
