import 'package:equatable/equatable.dart';

class WeatherForecastState extends Equatable {
  final double textTemperature;
  final String unit;
  final bool checkButton;

  const WeatherForecastState({
    required this.checkButton,
    required this.textTemperature,
    required this.unit,
  });
  factory WeatherForecastState.init() {
    return WeatherForecastState(
      textTemperature: 25,
      unit: 'C',
      checkButton: false,
    );
  }
  WeatherForecastState copyWith({
    double? textTemperature,
    String? unit,
    bool? checkButton,
  }) {
    return WeatherForecastState(
      textTemperature: textTemperature ?? this.textTemperature,
      unit: unit ?? this.unit,
      checkButton: checkButton ?? this.checkButton,
    );
  }

  @override
  List<Object?> get props => [textTemperature, unit];
}
