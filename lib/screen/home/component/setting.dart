import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final String icon;
  final String text;

  const Setting({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000514).withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
