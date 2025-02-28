import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetThemeEvent>(_onChangeImageTheme);
  }
  void _onChangeImageTheme(SetThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.imageTheme));
  }
}
