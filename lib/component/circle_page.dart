import 'package:flutter/cupertino.dart';
import 'package:weather_app/visibility/%20view/visibility_view.dart';
import 'package:weather_app/visibility/component/visibility_switch.dart';

import '../util/images.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({
    super.key,
    required this.color1,
    required this.textParameter,
    required this.color2,
    required this.located,
    required this.textAirQuality,
    required this.textState,
  });
  final String textAirQuality;
  final String located;
  final Color color1;
  final Color color2;
  final String textParameter;
  final String textState;

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  dynamic classVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconLocation),
            Center(
              child: Text(
                widget.located,

                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 31),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            widget.textAirQuality,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 34),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 282,
              width: 282,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(9, 9),
                    color: Color(0xff000000).withOpacity(0.1),
                    blurRadius: 16,
                  ),
                ],
                color: Color(0xffFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 242,
              width: 242,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [widget.color1, widget.color2],
                ),
              ),
              child: Center(
                child: Text(
                  widget.textParameter,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 56,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        if (classVisibility is VisibilityView)
          VisibilityButton()
        else
          Text(
            widget.textState,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
      ],
    );
  }
}
