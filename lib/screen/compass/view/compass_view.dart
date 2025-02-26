import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/util/images.dart';

class CompassView extends StatefulWidget {
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  double? heading = 0;
  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Compass'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconLocation),
              Text(
                'Hoài Đức, Hà Nội',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(imageCompass),
              Transform.rotate(
                angle: (heading ?? 0) * (pi / 180) * -1,
                child: Image.asset(imageNavigation, scale: 1.1),
              ),
            ],
          ),
          Text('${heading!.ceil()}'),
        ],
      ),
    );
  }
}
