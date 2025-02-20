import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/pollen/component/pollen_item.dart';

import '../../util/images.dart';

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
              Text(
                'Hoài Đức, Hà Nội',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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
