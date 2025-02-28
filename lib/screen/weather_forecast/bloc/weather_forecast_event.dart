import 'package:equatable/equatable.dart';

sealed class WeatherForecastEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChangeTemperatureEvent extends WeatherForecastEvent {
  final String unit;
  final double textTemperature;
  final bool checkButton;

  ChangeTemperatureEvent({
    required this.checkButton,
    required this.unit,
    required this.textTemperature,
  });
}
