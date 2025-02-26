import 'package:equatable/equatable.dart';
import 'package:weather_app/screen/themes/controller/theme_controller.dart';

class AppState extends Equatable {
  final String theme;

  const AppState({required this.theme});

  factory AppState.init() {
    return AppState(theme: ThemeController().listImageTheme.first);
  }

  AppState copyWith({String? theme}) {
    return AppState(theme: theme ?? this.theme);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [theme];
}
