import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class ButtonWeatherForecast extends StatefulWidget {
  final ValueChanged<bool> onUnitChanged; // Callback báo thay đổi đơn vị
  final bool initialValue;
  const ButtonWeatherForecast({
    super.key,
    required this.onUnitChanged,
     required this.initialValue,
  });

  @override
  State<ButtonWeatherForecast> createState() => _ButtonWeatherForecastState();
}

class _ButtonWeatherForecastState extends State<ButtonWeatherForecast> {
  bool firstSwitchValue = false;
  @override
  void initState() {
    super.initState();
    firstSwitchValue = widget.initialValue; // Khởi tạo từ initialValue
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 38,
              width: 62,
              child: AnimatedToggleSwitch<bool>.size(
                current: firstSwitchValue,
                values: [false, true],
                iconOpacity: 0.2,
                indicatorSize: const Size.fromHeight(32),

                customIconBuilder:
                    (context, local, global) => Text(
                      local.value ? 'F°' : 'C°',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.lerp(
                          Color(0xff6D6D6D),
                          Color(0xff8BC12B),
                          local.animationValue,
                        ),
                      ),
                    ),
                borderWidth: 5,
                iconAnimationType: AnimationType.onHover,
                style: ToggleStyle(
                  backgroundColor: Color(0xffDBDBDB),
                  indicatorColor: Colors.white,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                selectedIconScale: 1,

                onChanged: (value) {
                  setState(() => firstSwitchValue = value);
                  widget.onUnitChanged(value); //
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
