import 'package:bloc/bloc.dart';

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
