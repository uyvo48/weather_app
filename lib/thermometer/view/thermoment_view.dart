import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/thermometer/component/thermoment_item.dart';
import 'package:weather_app/util/images.dart';

class ThermomentView extends StatefulWidget {
  const ThermomentView({super.key});

  @override
  State<ThermomentView> createState() => _ThermomentViewState();
}

class _ThermomentViewState extends State<ThermomentView> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Thermometer'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTapDown: (_) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onTapUp: (_) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ThermomentItem(
                  choose: selectedIndex == index,
                  image: iconThermometer,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
