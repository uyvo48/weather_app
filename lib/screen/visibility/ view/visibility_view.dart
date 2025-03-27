import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_event.dart';
import '../../../app_bloc/app_state.dart';
import '../../../component/app_bar_setting_item.dart';
import '../../../component/circle_page.dart';
import '../component/visibility_switch.dart';

class VisibilityView extends StatefulWidget {
  const VisibilityView({super.key});

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  @override
  void initState() {
    super.initState();
  }

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
                color1: state.visibilityColor,
                textParameter: state.visibilityParameter,
                color2: state.visibilityColorEnd, // Gradient kết thúc
                located:
                    'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',

                textAirQuality: '',
                textState: '',
              ),
              VisibilityButton(
                isMiles: state.visibilityUnit == "mi",
                buttonColor: state.buttonColor,
                onUnitChanged: (value) {
                  context.read<AppBloc>().add(
                    SetVisibilityEvent(visibilityUnit: value ? "mi" : "km"),
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
