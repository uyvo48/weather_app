import 'package:flutter/material.dart';
import 'package:weather_app/home/component/language_item.dart';
import 'package:weather_app/util/images.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  int groupValue = 1;
  void _handleRadioValueChanged(int newValue) {
    setState(() {
      groupValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: null,
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
        ),
        title: Text(
          'Language',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.check_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LanguageItem(
                    iconLanguageItem: iconLanguageUS,
                    value: index,
                    groupValue: groupValue,
                    onChanged: _handleRadioValueChanged,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
