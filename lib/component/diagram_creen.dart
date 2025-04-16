import 'package:flutter/cupertino.dart';

class DiagramScreen extends StatelessWidget {
  const DiagramScreen({
    super.key,
    required this.textvalue,
    required this.located,
    required this.time,
    required this.textunit,
  });

  final String time;
  final String located;
  final String textvalue;
  final String textunit;

  // final dynamic classVisibility = VisibilityView();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            Center(
              child: Text(
                located,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            time,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff89909D),
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    textvalue,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff12203A),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    textAlign: TextAlign.center,
                    textunit,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff12203A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
