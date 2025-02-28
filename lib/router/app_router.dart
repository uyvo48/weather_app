import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screen/air_quality/view/air_quality_view.dart';
import '../screen/compass/view/compass_view.dart';
import '../screen/home/view/premission.dart';
import '../screen/home/view/setting_view.dart';
import '../screen/humidity/view/humidity_view.dart';
import '../screen/intro/view/intro_view.dart';
import '../screen/pollen/view/pollen_view.dart';
import '../screen/sun_set/view/sun_set_view.dart';
import '../screen/themes/view/theme_view.dart';
import '../screen/thermometer/view/thermoment_view.dart';
import '../screen/uv_index/view/uv_index_view.dart';
import '../screen/visibility/ view/visibility_view.dart';
import '../screen/weather_forecast/view/weather_forecast_view.dart';
import '../wind/view/wind_view.dart';

class AppRouter {
  static String intro = "intro";
  static String introPath = "/intro";
  static String homeScreen = "/";
  // child class home
  static String settingScreen = "settingScreen";
  static String settingScreenPath = "/setting_screen";

  static String uvIndexScreen = "uvIndexScreen";
  static String uvIndexScreenPath = "/uv_index_screen";

  static String humidityScreen = "humidityScreen";
  static String humidityScreenPath = "/humidity_screen";

  static String airQualityScreen = "airQualityScreen";
  static String ariQualityScreenPath = "/airQualityScreen";

  static String weatherForeCastScreen = "weatherForeCastScreen";
  static String weatherForecastScreenPath =
      "/home_screen/weather_forecast_screen";

  static String visibilityScreen = "visibilityScreen";
  static String visibilityScreenPath = "/home_screen/visibility_screen";

  static String windScreen = "windScreen";
  static String windScreenPath = "/home_screen/wind_screen";

  static String snowFallScreen = "snowFallScreen";
  static String snowFallScreenPath = "/home_screen/snow_fall_screen";

  static String compassScreen = "compassScreen";
  static String compassScreenPath = "/home_screen/compass_screen";

  static String precipitationScreen = "precipitationScreen";
  static String precipitationScreenPath = "/home_screen/precipitation_screen";

  static String sunTimeScreen = "sunTimeScreen";
  static String sunTimeScreenPath = "/home_screen/sun_time_screen";

  static String pollenScreen = "pollenScreen";
  static String pollenScreenPath = "/home_screen/pollen_screen";

  static String waveScreen = "waveScreen";
  static String waveScreenPath = "/home_screen/wave_screen";

  // child class setting
  static String themeScreen = "themScreen";
  static String themeScreenPath = "theme_screen";

  static String languageScreen = "LanguageScreen";
  static String languageScreenPath = "/setting_screen/language";

  static String thermometerScreen = "ThermometerScreen";
  static String thermometerScreenPath = "/setting_screen/thermometer_screen";

  static String temperatureScreen = "TemperatureScreen";
  static String temperatureScreenPath = "/setting_screen/temperature_screen";
  GoRouter router = GoRouter(
    initialLocation: introPath,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: intro,
        path: introPath,
        builder: (context, state) {
          return IntroView();
        },
      ),
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
            routes: [
              GoRoute(
                name: thermometerScreen,
                path: thermometerScreenPath,
                builder: (context, state) {
                  return ThermomentView();
                },
              ),

              GoRoute(
                name: themeScreen,
                path: themeScreenPath,
                builder: (context, state) {
                  return ThemeView();
                },
              ),
            ],
          ),

          // UV
          GoRoute(
            name: uvIndexScreen,
            path: humidityScreenPath,
            builder: (context, state) {
              return UvIndexView();
            },
          ),
          GoRoute(
            name: humidityScreen,
            path: humidityScreenPath,
            builder: (context, state) {
              return HumidityView();
            },
          ),
          GoRoute(
            name: airQualityScreen,
            path: ariQualityScreenPath,
            builder: (context, state) {
              return AirQualityView();
            },
          ),
          GoRoute(
            name: weatherForeCastScreen,
            path: weatherForecastScreenPath,
            builder: (context, state) {
              return WeatherForecastView();
            },
          ),
          GoRoute(
            name: visibilityScreen,
            path: visibilityScreenPath,
            builder: (context, state) {
              return VisibilityView();
            },
          ),
          // Wind
          GoRoute(
            name: windScreen,
            path: windScreenPath,
            builder: (context, state) {
              return WindView();
            },
          ),
          GoRoute(
            name: snowFallScreen,
            path: snowFallScreenPath,
            builder: (context, state) {
              return UvIndexView();
            },
          ),
          GoRoute(
            name: compassScreen,
            path: compassScreenPath,
            builder: (context, state) {
              return CompassView();
            },
          ),
          GoRoute(
            name: precipitationScreen,
            path: precipitationScreenPath,
            builder: (context, state) {
              return Container();
            },
          ),
          GoRoute(
            name: sunTimeScreen,
            path: sunTimeScreenPath,
            builder: (context, state) {
              return SunSetView();
            },
          ),
          GoRoute(
            name: pollenScreen,
            path: pollenScreenPath,
            builder: (context, state) {
              return PollenView();
            },
          ),
          GoRoute(
            name: waveScreen,
            path: waveScreenPath,
            builder: (context, state) {
              return Container();
            },
          ),
        ],
      ),
    ],
  );
}
