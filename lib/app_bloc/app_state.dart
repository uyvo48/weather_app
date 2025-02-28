import 'package:equatable/equatable.dart';
import 'package:weather_app/screen/themes/controller/theme_controller.dart';
import 'package:weather_app/screen/thermometer/controller/thermometer_controller.dart';

class AppState extends Equatable {
  final String theme;
  final String thermometer;
  const AppState({required this.theme, required this.thermometer});

  factory AppState.init() {
    return AppState(
      theme: ThemeController().listImageTheme.first,
      thermometer: ThermometerController().listImageThermometer.first,
    );
  }

  AppState copyWith({String? theme, String? thermometer}) {
    return AppState(
      theme: theme ?? this.theme,
      thermometer: thermometer ?? thermometer ?? this.thermometer,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [theme];
}
