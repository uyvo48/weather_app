import 'package:flutter/material.dart';

class IntroComponent extends StatelessWidget {
  final String image;
  final String icon;
  final String text1;
  final String text2;

  IntroComponent({
    super.key,
    required this.image,
    required this.icon,
    required this.text1,
    required this.text2,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(bottom: -30, left: 160, child: Image.asset(icon)),
              ],
            ),
          ],
        ),
        SizedBox(height: 21),
        Text(
          '$text1',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          '$text2',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff12203A).withOpacity(0.5),
          ),
        ),
        SizedBox(height: 31),
      ],
    );
  }
}
