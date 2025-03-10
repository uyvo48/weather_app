import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ListWeather extends StatelessWidget {
  final int color;
  final String iconWeather;
  final String nameWeather;
  final String screenItem;

  const ListWeather({
    super.key,
    required this.color,
    required this.iconWeather,
    required this.nameWeather,
    required this.screenItem,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(screenItem);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
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
            nameWeather,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff081D3F),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
