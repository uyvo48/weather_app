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

final class SetThermometerEvent {
  final String imageThermometer;
  const SetThermometerEvent({required this.imageThermometer});
}
