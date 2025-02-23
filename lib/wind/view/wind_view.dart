import 'package:flutter/material.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import '../../util/images.dart';

class WindView extends StatefulWidget {
  const WindView({super.key});

  @override
  State<WindView> createState() => _WindViewState();
}

class _WindViewState extends State<WindView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          ],
        ),
      ),
    );
  }
}
