import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import '../ component/sun_time_item.dart';
import '../../util/images.dart';

class SunSetView extends StatefulWidget {
  const SunSetView({super.key});

  @override
  State<SunSetView> createState() => _SunSetViewState();
}

class _SunSetViewState extends State<SunSetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Sun Time '),
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,

              itemCount: 3,
              itemBuilder: (context, index) {
                return SunTimeItem(
                  iconSunState: iconSunRise,
                  textSunState: 'Sunrise ',
                  textTime: '05:30 AM',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
