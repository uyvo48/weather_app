import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  final bool choose;
  final String image;
  const ThemePage({super.key, required this.image, required this.choose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 146,
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
          color: choose ? Color(0xff8FA940) : Color(0xffFFFFFF),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
