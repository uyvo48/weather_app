import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/screen/home/component/show_disconnet_location.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_event.dart';
import '../../../app_bloc/app_state.dart';
import '../../../router/app_router.dart';
import '../../../util/images.dart';
import '../component/weather_forcast.dart';
import '../home_controller/home_controller.dart';

class Premission extends StatefulWidget {
  const Premission({super.key});

  @override
  State<Premission> createState() => PremissionState();
}

class PremissionState extends State<Premission> {
  bool isLocation = false;
  bool isNetwork = false;
  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.checkLocationStatus((isEnable) {
      setState(() {
        isLocation = isEnable;
        print(
          "trang thai dinjg vijbjhgugkugiuhiuyhuih99999999999999999999" +
              "$isLocation",
        );
      });
    });
    homeController.checkStatusInternet((isConnected) {
      setState(() {
        isNetwork = isConnected;

        if (!isConnected) {
          homeController.showDialogBoxInternet(context);
        }
      });
    });
    context.read<AppBloc>().add(SetLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            isLocation ? Container() : ShowDisconnectLocation(),

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
                                        return Expanded(
                                          child: Image.asset(
                                            state.thermometer,

                                            fit: BoxFit.fill,
                                          ),
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
                                  child: BlocBuilder<AppBloc, AppState>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(child: Image.asset(iconUv)),
                                          SizedBox(width: 12),
                                          Column(
                                            children: [
                                              Text(
                                                'UV index',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                "${state.uvIndexMax}",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
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
                                          Column(
                                            children: [
                                              Text(
                                                'Humidity ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                "${state.humidity}",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
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
