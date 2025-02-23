import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import 'line_chart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBarSettingItem(textSettingItem: 'wind'),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: PageView(children: [LineChartPage()]),
    ),
  );
}
