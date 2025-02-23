import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/home/home_controller/home_controller.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/util/images.dart';

import '../component/weather_forcast.dart';

class Premission extends StatefulWidget {
  const Premission({super.key});

  @override
  State<Premission> createState() => PremissionState();
}

class PremissionState extends State<Premission> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 700,
              decoration: BoxDecoration(
                image: DecorationImage(image: ExactAssetImage(homeBanner)),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Image.asset(homeBanner, fit: BoxFit.fill),
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
                            ).push(AppRouter.settingScreenPath);
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
                        height: 225,
                        width: 80,

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
                                  color: Color(0xff6C757FD),
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
                                BoxShadow(color: Colors.black12, blurRadius: 5),
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
                                  decoration: BoxDecoration(color: Colors.grey),
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
                      itemCount: homeController.listWeatherForCast.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: ListWeather(
                            color:
                                homeController.listWeatherForCast[index].color,
                            iconWeather:
                                homeController
                                    .listWeatherForCast[index]
                                    .iconWeather,
                            nameWeather:
                                homeController
                                    .listWeatherForCast[index]
                                    .nameWeather,
                          ),
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
    );
  }
}
