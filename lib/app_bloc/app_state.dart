import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:weather_app/screen/themes/controller/theme_controller.dart';
import 'package:weather_app/screen/thermometer/controller/thermometer_controller.dart';

class AppState extends Equatable {
  final String theme;
  final String thermometer;
  final Color visibilityColor; // Màu bắt đầu gradient của CirclePage
  final Color visibilityColorEnd; // Màu kết thúc gradient của CirclePage
  final Color buttonColor; // Màu của VisibilityButton
  final double visibilityParameter;
  final String visibilityUnit;

  const AppState({
    required this.theme,
    required this.thermometer,
    required this.visibilityColor,
    required this.visibilityColorEnd,
    required this.buttonColor,
    required this.visibilityParameter,
    required this.visibilityUnit,
  });

  factory AppState.init() {
    return AppState(
      theme: ThemeController().listImageTheme.first,
      thermometer: ThermometerController().listImageThermometer.first,
      visibilityColor: const Color(0xff5363F3),
      visibilityColorEnd: const Color(0xff4BcFF9),
      buttonColor: const Color(0xff4DBFF9),
      visibilityParameter: 24.4,
      visibilityUnit: "km",
    );
  }

  AppState copyWith({
    String? theme,
    String? thermometer,
    Color? visibilityColor,
    Color? visibilityColorEnd,
    Color? buttonColor,
    double? visibilityParameter,
    String? visibilityUnit,
  }) {
    return AppState(
      theme: theme ?? this.theme,
      thermometer: thermometer ?? this.thermometer,
      visibilityColor: visibilityColor ?? this.visibilityColor,
      visibilityColorEnd: visibilityColorEnd ?? this.visibilityColorEnd,
      buttonColor: buttonColor ?? this.buttonColor,
      visibilityParameter: visibilityParameter ?? this.visibilityParameter,
      visibilityUnit: visibilityUnit ?? this.visibilityUnit,
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
  ];
}
