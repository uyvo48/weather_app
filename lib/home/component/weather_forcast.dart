import 'package:flutter/cupertino.dart';

class ListWeather extends StatelessWidget {
  final int color;
  final String iconWeather;
  final String nameWeather;

  const ListWeather({
    super.key,
    required this.color,
    required this.iconWeather,
    required this.nameWeather,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffEAEAEA),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                height: 30,
                width: 20,
                decoration: BoxDecoration(
                  color: Color(color),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(iconWeather, height: 16, width: 12),
              ),
            ),
          ],
        ),
        Text(
          '$nameWeather',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff081D3F),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
