import 'package:flutter/material.dart';
import 'package:weather_app/component/circle_page.dart';

import '../../../component/app_bar_setting_item.dart';

class UvIndexView extends StatefulWidget {
  const UvIndexView({super.key});

  @override
  State<UvIndexView> createState() => _UvIndexViewState();
}

class _UvIndexViewState extends State<UvIndexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'UltraViolet(UV)'),
      body: CirclePage(
        checkUnit: false,
        unit: "",
        color1: Color(0xffF36253),
        textParameter: 0.85,
        color2: Color(0xffF9ED4B),
        located: 'Hoài Đức',
        textAirQuality: 'Low',
        textState: 'Good',
      ),
    );
  }
}
