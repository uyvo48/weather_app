import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final String iconLanguageItem;
  final int value;
  final int groupValue;
  final Function(int) onChanged; // Callback để cập nhật giá trị từ LanguageView

  const LanguageItem({
    super.key,
    required this.iconLanguageItem,
    required this.value,
    required this.groupValue,
    required this.onChanged, // Nhận callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconLanguageItem,
            height: 28,
            width: 28,
            fit: BoxFit.fill,
          ),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (newValue) {
              if (newValue != null) {
                onChanged(newValue); // Gọi hàm callback
              }
            },
          ),
        ],
      ),
    );
  }
}
