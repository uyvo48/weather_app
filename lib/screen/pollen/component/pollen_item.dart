import 'package:flutter/material.dart';

class PollenItem extends StatelessWidget {
  final String iconPollenItem;
  final String textPollenItem;
  final String data;
  const PollenItem({
    super.key,
    required this.iconPollenItem,
    required this.textPollenItem,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            offset: Offset(9, 9),
            blurRadius: 16,
          ),
        ],
      ),
      height: 160,
      width: 146,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Color(0xffE1FFEF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(iconPollenItem),
                ),
                SizedBox(height: 12),
                Text(
                  textPollenItem,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff12203A).withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff000000).withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              data,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
