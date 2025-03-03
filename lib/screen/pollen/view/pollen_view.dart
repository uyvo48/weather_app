import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import '../../../util/images.dart';
import '../component/pollen_item.dart';

class PollenView extends StatefulWidget {
  const PollenView({super.key});

  @override
  State<PollenView> createState() => _PollenViewState();
}

class _PollenViewState extends State<PollenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Pollen'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconLocation),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Text(
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  );
                },
              ),
            ],
          ),
          Text('14:51'),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: PollenItem(
                    iconPollenItem: iconWave,
                    textPollenItem: 'textPollenItem',
                    data: 'data',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
