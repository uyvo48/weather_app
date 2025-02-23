import 'dart:core';

import 'package:go_router/go_router.dart';
import 'package:weather_app/home/view/premission.dart';

import '../home/view/setting_view.dart';

class AppRouter {
  static String homeScreen = "/";
  // child class home
  static String settingScreen = "settingScreen";
  static String settingScreenPath = "/setting_screen";
  static String uvIndexScreen = "/home_screen/uv_index_screen";
  static String humidityScreen = "/home_screen/humidity_screen";
  static String airQualityScreen = "/home_screen/air_quality_screen";
  static String weatherForecastScreen = "/home_screen/weather_forecast_screen";
  static String visibilityScreen = "/home_screen/visibility_screen";
  static String windScreen = "/home_screen/wind_screen";
  static String snowFallScreen = "/home_screen/snow_fall_screen";
  static String compassScreen = "/home_screen/compass_screen";
  static String precipitationScreen = "/home_screen/precipitation_screen";
  static String sunTimeScreen = "/home_screen/sun_time_screen";
  static String pollenScreen = "/home_screen/pollen_screen";
  static String waveScreen = "/home_screen/wave_screen";

  // child class setting
  static String themeScreen = "/home_screen/setting_screen/theme_screen";
  static String languageScreen = "/home_screen/setting_screen/language";
  static String thermometerScreen =
      "/home_screen/setting_screen/thermometer_screen";

  GoRouter router = GoRouter(
    initialLocation: AppRouter.homeScreen,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          return Premission();
        },
        routes: [
          GoRoute(
            name: settingScreen,
            path: settingScreenPath,
            builder: (context, state) {
              return SettingView();
            },
          ),
        ],
      ),
    ],
  );
}
