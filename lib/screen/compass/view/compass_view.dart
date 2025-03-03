import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/screen/compass/bloc/compass_bloc.dart';
import 'package:weather_app/screen/compass/bloc/compass_state.dart';
import 'package:weather_app/util/images.dart';

class CompassView extends StatefulWidget {
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
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
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Text(
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  );
                },
              ),
            ],
          ),
          BlocBuilder<CompassBloc, CompassState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(imageCompass),
                  Transform.rotate(
                    angle: state.rotationAngle,
                    child: Image.asset(imageNavigation, scale: 1.1),
                  ),
                ],
              );
            },
          ),
          BlocBuilder<CompassBloc, CompassState>(
            builder: (context, state) {
              return Text('${state.displayHeading}');
            },
          ),
        ],
      ),
    );
  }
}
