import 'dart:ui';

import 'package:equatable/equatable.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object> get props => [];
}

final class SetThemeEvent extends AppEvent {
  final String imageTheme;
  const SetThemeEvent({required this.imageTheme});
  @override
  List<Object> get props => [imageTheme];
}

final class SetThermometerEvent extends AppEvent {
  final String imageThermometer;
  const SetThermometerEvent({required this.imageThermometer});
  @override
  List<Object> get props => [imageThermometer];
}

final class SetVisibilityEvent extends AppEvent {
  final Color visibilityColor;
  final Color visibilityColorEnd;
  final Color buttonColor;
  final double visibilityParameter;
  final String visibilityUnit;

  const SetVisibilityEvent({
    required this.visibilityColor,
    required this.visibilityColorEnd,
    required this.buttonColor,
    required this.visibilityParameter,
    required this.visibilityUnit,
  });

  @override
  List<Object> get props => [
    visibilityColor,
    visibilityColorEnd,
    buttonColor,
    visibilityParameter,
    visibilityUnit,
  ];
}
