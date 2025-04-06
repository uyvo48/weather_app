import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/home_controller/home_controller.dart';

import '../../../util/images.dart';
import '../../../widget/custom_app_button.dart';

class ShowDisconnectLocation extends StatelessWidget {
  ShowDisconnectLocation({super.key});

  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(iconErrol),
              Text(
                'Enable device location permission to update '
                'temperature\n'
                ' and weather condition',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          CustomAppButton(
            onPressed:
                () => showDialog(
                  context: context,
                  builder:
                      (BuildContext context) => AlertDialog(
                        elevation: 0,
                        title: const Text('Allow location access'),
                        content: const Text(
                          'Update temperature and weather conditions of your location by allowing access to your precise location',
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomAppButton(
                                height: 46,
                                width: 140,
                                backgroundColor: Colors.white,
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              CustomAppButton(
                                elevation: 0,
                                height: 46,
                                width: 140,
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  AppSettings.openAppSettings(
                                    type: AppSettingsType.location,
                                  );
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                ),
            width: 102,
            backgroundColor: Color(0xff2196F3),
            text: 'Allow',
            textStyle: TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
          ),
        ],
      ),
    );
  }
}
