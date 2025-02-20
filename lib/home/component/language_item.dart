import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget {
  final String iconLanguageItem;
  const LanguageItem({super.key, required this.iconLanguageItem});

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

enum SingingCharacter { lafayette, jefferson }

class _LanguageItemState extends State<LanguageItem> {
  SingingCharacter? _character = SingingCharacter.lafayette;

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
            color: Color(0xff000000),
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            widget.iconLanguageItem,
            height: 28,
            width: 28,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
