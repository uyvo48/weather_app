import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';

import '../ component/sun_time_item.dart';
import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_state.dart';
import '../../../util/images.dart';

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
