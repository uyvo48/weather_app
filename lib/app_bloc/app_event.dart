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
  final String visibilityUnit;
  const SetVisibilityEvent({required this.visibilityUnit});

  @override
  List<Object> get props => [visibilityUnit];
}

final class SetLocationEvent extends AppEvent {}

final class SetUvIndexMax extends AppEvent {}

final class SetHumidity extends AppEvent {}

final class SetAirQuality extends AppEvent {}
