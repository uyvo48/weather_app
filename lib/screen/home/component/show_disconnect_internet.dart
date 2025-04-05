import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

import '../../../widget/custom_app_button.dart';

class ShowDisconnectInternet extends StatefulWidget {
  const ShowDisconnectInternet({super.key});

  @override
  State<ShowDisconnectInternet> createState() => _ShowDisconnectInternetState();
}

class _ShowDisconnectInternetState extends State<ShowDisconnectInternet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No internet connection',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          textAlign: TextAlign.center,
          'Check your internet connection and try again.',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppButton(
              height: 46,
              width: 140,
              backgroundColor: Color(0xffFFFFFF),
              textColor: Color(0xff000000),
              text: 'Close',
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              textStyle: TextStyle(
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomAppButton(
              height: 46,
              width: 140,
              backgroundColor: Color(0xff28B2FF),
              onPressed: () {
                AppSettings.openAppSettings(type: AppSettingsType.settings);
              },
              child: const Text(
                'Open Setting',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
