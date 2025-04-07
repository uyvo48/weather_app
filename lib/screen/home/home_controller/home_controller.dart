import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/util/images.dart';

import '../component/show_disconnect_internet.dart';
import '../model/home_model.dart';
import '../model/seting_model.dart';

class HomeController {
  List<HomeModel> listWeatherForCast = [
    HomeModel(0xffFF8B5, iconUv, 'index', AppRouter.uvIndexScreen),
    HomeModel(
      0xffD5EAFF,
      iconHumidityMini,
      'Humidity',
      AppRouter.humidityScreen,
    ),
    HomeModel(
      0xffF9D5D3,
      iconAirQuality,
      'Air\nQuality',
      AppRouter.airQualityScreen,
    ),
    HomeModel(
      0xffE9E3FA,
      iconWeatherForecast,
      'Weather\n Forecast',
      AppRouter.weatherForeCastScreen,
    ),
    HomeModel(
      0xffC8F0DA,
      iconVisibility,
      'Visibility',
      AppRouter.visibilityScreen,
    ),
    HomeModel(0xffFAE3E3, iconWind, 'Wind', AppRouter.windScreen),
    HomeModel(0xffE7E8EC, iconSnowFall, 'Snow\nFal ', AppRouter.snowFallScreen),
    HomeModel(0xffF9F0E3, iconCompass, 'Compass', AppRouter.compassScreen),
    HomeModel(
      0xffD3F9F9,
      iconPrecipitation,
      'Precipitation',
      AppRouter.precipitationScreen,
    ),
    HomeModel(0xffFAD4F8, iconSunTime, 'Sun\nTime', AppRouter.sunTimeScreen),
    HomeModel(0xffD4DAFA, iconPollen, 'Pollen', AppRouter.pollenScreen),
    HomeModel(0xffF9FFD8, iconWave, 'Wave', AppRouter.waveScreen),
  ];

  List<SettingModel> listSetting = [
    SettingModel(
      iconThermometerSetting,
      'Thermometers',
      AppRouter.thermometerScreen,
    ),
    SettingModel(iconTemperature, 'Temperature', AppRouter.temperatureScreen),
    SettingModel(iconThemes, 'Theme', AppRouter.themeScreen),
    SettingModel(iconLanguage, 'Language', AppRouter.languageScreen),
    SettingModel(iconContent, 'Modify my content', ''),
    SettingModel(iconConditonSetting1, 'Term of condition', ''),
    SettingModel(iconPrivacy, 'Privacy', ''),
    SettingModel(iconContact, 'Contact us', ''),
    SettingModel(iconShare, 'Share app', ''),
  ];

  StreamSubscription<ServiceStatus>? subscriptionLoctation;

  void checkLocationStatus(Function(bool) onStatus) async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    onStatus(isEnabled);

    subscriptionLoctation = Geolocator.getServiceStatusStream().listen((
      ServiceStatus status,
    ) {
      onStatus(status == ServiceStatus.enabled);
    });
  }

  StreamSubscription<List<ConnectivityResult>>? subscriptionInternet;

  void checkStatusInternet(Function(bool) onStatusInternet) {
    subscriptionInternet = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      bool isConnected =
          result.isNotEmpty &&
          result.any((result) => result != ConnectivityResult.none);
      onStatusInternet(isConnected);
    });
  }

  void showDialogBoxInternet(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Image.asset(iconDisconnectedInternet),
            actions: [ShowDisconnectInternet()],
          ),
    );
  }
}
