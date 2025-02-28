import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_event.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/screen/thermometer/controller/thermometer_controller.dart';

import '../../../router/app_router.dart';
import '../component/thermoment_item.dart';

class ThermomentView extends StatefulWidget {
  const ThermomentView({super.key});

  @override
  State<ThermomentView> createState() => _ThermomentViewState();
}

class _ThermomentViewState extends State<ThermomentView> {
  final ThermometerController thermometerController = ThermometerController();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Thermometer'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: thermometerController.listImageThermometer.length,
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
              onTap: () {
                context.read<AppBloc>().add(
                  SetThermometerEvent(
                    imageThermometer:
                        thermometerController.listImageThermometer[index],
                  ),
                );
                GoRouter.of(context).go(AppRouter.homeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ThermomentItem(
                  choose: selectedIndex == index,
                  image: thermometerController.listImageThermometer[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
