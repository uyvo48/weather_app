import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:weather_app/model/weather.dart';

import '../screen/themes/controller/theme_controller.dart';
import '../screen/thermometer/controller/thermometer_controller.dart';

class AppState extends Equatable {
  final String theme;
  final String thermometer;
  final Color visibilityColor;
  final Color visibilityColorEnd;
  final Color buttonColor;
  final double visibilityParameter;
  final String visibilityUnit;
  final double latitude;
  final double longitude;
  final double uvIndexMax;
  final double? rawVisibility;
  final Weather? weather;
  final double humidity;
  final double airQuality;

  const AppState({
    required this.airQuality,
    required this.humidity,
    required this.weather,
    required this.uvIndexMax,
    required this.longitude,
    required this.latitude,

    required this.theme,
    required this.thermometer,
    required this.visibilityColor,
    required this.visibilityColorEnd,
    required this.buttonColor,
    required this.visibilityParameter,
    required this.visibilityUnit,
    this.rawVisibility, // Thêm vào constructor
  });

  factory AppState.init() {
    return AppState(
      airQuality: 0,
      humidity: 0,
      weather: null,
      uvIndexMax: 1,
      latitude: 0,
      longitude: 0,
      theme: ThemeController().listImageTheme.first,
      thermometer: ThermometerController().listImageThermometer.first,
      visibilityColor: const Color(0xff5363F3),
      visibilityColorEnd: const Color(0xff4BcFF9),
      buttonColor: const Color(0xff4DBFF9),
      visibilityParameter: 0,
      visibilityUnit: "km",
    );
  }

  AppState copyWith({
    double? airQuality,
    String? theme,
    String? thermometer,
    Color? visibilityColor,
    Color? visibilityColorEnd,
    Color? buttonColor,
    double? visibilityParameter,
    String? visibilityUnit,
    double? longitude,
    double? latitude,
    double? uvIndexMax,
    double? rawVisibility,
    Weather? weather,
    double? humidity,
  }) {
    return AppState(
      airQuality: airQuality ?? this.airQuality,
      humidity: humidity ?? this.humidity,
      weather: weather ?? this.weather,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      theme: theme ?? this.theme,
      thermometer: thermometer ?? this.thermometer,
      visibilityColor: visibilityColor ?? this.visibilityColor,
      visibilityColorEnd: visibilityColorEnd ?? this.visibilityColorEnd,
      buttonColor: buttonColor ?? this.buttonColor,
      visibilityParameter: visibilityParameter ?? this.visibilityParameter,
      visibilityUnit: visibilityUnit ?? this.visibilityUnit,
      rawVisibility: rawVisibility ?? this.rawVisibility,
    );
  }

  @override
  List<Object?> get props => [
    theme,
    thermometer,
    visibilityUnit,
    visibilityParameter,
    visibilityColor,
    visibilityColorEnd,
    buttonColor,
    latitude,
    longitude,
    uvIndexMax,
    rawVisibility,
    humidity, // Thêm vào props
  ];
}
