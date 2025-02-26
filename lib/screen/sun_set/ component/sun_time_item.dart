import 'package:flutter/cupertino.dart';

class SunTimeItem extends StatelessWidget {
  final String iconSunState;
  final String textSunState;
  final String textTime;

  const SunTimeItem({
    super.key,
    required this.iconSunState,
    required this.textSunState,
    required this.textTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconSunState),
        Text(
          textSunState,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xff12203A).withOpacity(0.53),
          ),
        ),
        Text(
          textTime,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xff12203A),
          ),
        ),
      ],
    );
  }
}
