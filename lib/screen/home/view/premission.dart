import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:weather_app/app_bloc/app_event.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_state.dart';
import '../../../router/app_router.dart';
import '../../../util/images.dart';
import '../../../widget/custom_app_button.dart';
import '../component/weather_forcast.dart';
import '../home_controller/home_controller.dart';

class Premission extends StatefulWidget {
  const Premission({super.key});

  @override
  State<Premission> createState() => PremissionState();
}

class PremissionState extends State<Premission> {
  late StreamSubscription _streamSubscription;
  bool isDeviceConnected = false;
  bool isAlert = false;
  HomeController homeController = HomeController();
  Location location = Location();

  @override
  void initState() {
    super.initState();
    _checkInitialConnection(); // Kiểm tra kết nối ban đầu
    _listenToConnectivityChanges(); // Lắng nghe thay đổi kết nối
    context.read<AppBloc>().add(SetLocationEvent());
  }

  @override
  void dispose() {
    _streamSubscription.cancel(); // Hủy stream đúng cách
    super.dispose();
  }

  // Kiểm tra kết nối ban đầu
  Future<void> _checkInitialConnection() async {
    var connectivityResults = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResults);
  }

  // Lắng nghe thay đổi kết nối
  void _listenToConnectivityChanges() {
    _streamSubscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) {
      _updateConnectionStatus(results);
    });
  }

  // Cập nhật trạng thái kết nối
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    setState(() {
      // Kiểm tra xem có kết nối nào trong danh sách không
      if (results.contains(ConnectivityResult.none) && results.length == 1) {
        isDeviceConnected = false;
        if (!isAlert) {
          showDialogBox();
          isAlert = true;
        }
      } else {
        isDeviceConnected = true;
        if (isAlert) {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pop(); // Đóng dialog nếu đang mở
          isAlert = false;
        }
      }
    });
  }

  // Hiển thị dialog khi không có kết nối
  void showDialogBox() {
    showCupertinoDialog(
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
                          AppSettings.openAppSettings(
                            type: AppSettingsType.wifi,
                          );
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
  }

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
            Expanded(
              child: Stack(
                children: [
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
                                  'Smart thermometer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(iconLocation),
                                    SizedBox(width: 8),
                                    BlocBuilder<AppBloc, AppState>(
                                      builder: (context, state) {
                                        return Text(
                                          'Vĩ độ: ${state.latitude}, Kinh độ: ${state.longitude}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        );
                                      },
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
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              height: 240,
                              width: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    BlocBuilder<AppBloc, AppState>(
                                      builder: (context, state) {
                                        return Image.asset(
                                          state.thermometer,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  homeController.listWeatherForCast.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 2.0,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
