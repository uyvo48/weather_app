import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_state.dart';
import '../../../router/app_router.dart';
import '../../../util/images.dart';
import '../../../widget/custom_app_button.dart';
import '../component/weather_forcast.dart';
import '../home_controller/home_controller.dart';

class Premission extends StatefulWidget {
  const Premission({super.key, d});

  @override
  State<Premission> createState() => PremissionState();
}

class PremissionState extends State<Premission> {
  late StreamSubscription _streamSubCription;
  bool isDeviceConnect = false;
  bool isAlert = false;
  HomeController homeController = HomeController();
  Location location = Location();
  @override
  void initState() {
    super.initState();
    internetConnection();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubCription.cancel();
  }

  internetConnection() =>
      _streamSubCription = Connectivity().onConnectivityChanged.listen((
        result,
      ) async {
        if (!isDeviceConnect && isAlert == false) {
          showDialogBox();
          /*setState(() {
            isAlert = true;
          }*/
        }
      });
  showDialogBox() => showCupertinoDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          title: Image.asset(iconDisconnectedInternet),
          actions: [
            Column(
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
                        GoRouter.of(context).pop();
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
                        AppSettings.openAppSettings(type: AppSettingsType.wifi);
                      },

                      child: const Text(
                        'Open Setting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 80,
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
                        () => showDialog<String>(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomAppButton(
                                        height: 46,
                                        width: 140,
                                        backgroundColor: Colors.white,
                                        onPressed:
                                            () => Navigator.pop(context, 'OK'),
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
                                          homeController.determinePosition();
                                          Navigator.pop(context);
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
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: ExactAssetImage(widget.imageThemes.imageItem),
                //     ),
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white.withOpacity(0.1),
                //     ),
                //   ),
                // ),
                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return Image.asset(
                      state.theme,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Smart thermoeter',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(iconLocation),
                                  SizedBox(width: 8),
                                  Text(
                                    'Hoài Đức, Hoài Đức',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 80),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,

                                  spreadRadius: 5,
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).go(AppRouter.settingScreenPath);
                              },
                              child: Image.asset(iconSetUp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 41),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 5),
                              ],
                            ),
                            height: 240,
                            width: 90,

                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Image.asset(iconThermometer),
                                  Text(
                                    '30°C/80°F',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Feel like',
                                    style: TextStyle(
                                      color: Color(0xff6C757F),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '28°C/28°F',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Stack(
                            children: [
                              Container(
                                height: 72,
                                width: 232,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Center(child: Image.asset(iconUv)),
                                    SizedBox(width: 12),
                                    Text(
                                      'UV index\n '
                                      '????',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 13),
                                    Container(
                                      height: 56,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Center(
                                      child: Image.asset(
                                        iconHumidity,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      'Humidity \n '
                                      '????',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 31),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 300,
                        width: 382,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: homeController.listWeatherForCast.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 3.0,
                                mainAxisSpacing: 1.0,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return ListWeather(
                              color:
                                  homeController
                                      .listWeatherForCast[index]
                                      .color,
                              iconWeather:
                                  homeController
                                      .listWeatherForCast[index]
                                      .iconWeather,
                              nameWeather:
                                  homeController
                                      .listWeatherForCast[index]
                                      .nameWeather,
                              screenItem:
                                  homeController
                                      .listWeatherForCast[index]
                                      .screenItem,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
