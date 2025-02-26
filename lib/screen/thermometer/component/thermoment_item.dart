import 'package:flutter/material.dart';

class ThermomentItem extends StatelessWidget {
  final bool choose;
  final String image;
  const ThermomentItem({super.key, required this.choose, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1642,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 4,
          color: choose ? Color(0xff8FA940) : Color(0xffFFFFFF),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Color(0xff000514).withOpacity(0.1))],
      ),
      child: Image.asset(image),
    );
  }
}
