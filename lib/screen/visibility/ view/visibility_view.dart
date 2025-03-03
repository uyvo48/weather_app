import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/component/circle_page.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_event.dart';
import '../../../app_bloc/app_state.dart';
import '../component/visibility_switch.dart';

class VisibilityView extends StatelessWidget {
  const VisibilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarSettingItem(textSettingItem: 'Visibility'),
          body: Column(
            children: [
              CirclePage(
                checkUnit: true,
                unit: state.visibilityUnit,
                color1: state.visibilityColor, // Gradient bắt đầu
                textParameter: state.visibilityParameter,
                color2: state.visibilityColorEnd, // Gradient kết thúc
                located:
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                textAirQuality: '',
                textState: '',
              ),
              VisibilityButton(
                isMiles: state.visibilityUnit == "mi",
                buttonColor: state.buttonColor, // Truyền màu button từ state
                onUnitChanged: (value) {
                  context.read<AppBloc>().add(
                    SetVisibilityEvent(
                      visibilityColor: state.visibilityColor,
                      visibilityColorEnd: state.visibilityColorEnd,
                      buttonColor: state.buttonColor,
                      visibilityParameter: state.visibilityParameter,
                      visibilityUnit: value ? "mi" : "km",
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
