import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:geolocator/geolocator.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetThemeEvent>(_onChangeImageTheme);
    on<SetThermometerEvent>(_onChangeImageThermometer);
    on<SetVisibilityEvent>(_onChangeVisibility);
    on<SetLocationEvent>(onLocationHome);
  }

  void _onChangeImageTheme(SetThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.imageTheme));
  }

  void _onChangeImageThermometer(
    SetThermometerEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(thermometer: event.imageThermometer));
  }

  void _onChangeVisibility(SetVisibilityEvent event, Emitter<AppState> emit) {
    final isSwitchingToMiles = event.visibilityUnit.toLowerCase() == "mi";
    final newParameter =
        isSwitchingToMiles
            ? state.visibilityParameter * 0.621371
            : state.visibilityParameter / 0.621371;

    // Màu gradient cho CirclePage
    final newColorStart =
        isSwitchingToMiles
            ? const Color(0xffFF6F61) // Gradient bắt đầu cho mi
            : const Color(0xff5363F3); // Gradient bắt đầu cho km
    final newColorEnd =
        isSwitchingToMiles
            ? const Color(0xffFF9A8B) // Gradient kết thúc cho mi
            : const Color(0xff4BcFF9); // Gradient kết thúc cho km

    // Màu riêng cho button
    final newButtonColor =
        isSwitchingToMiles
            ? const Color(0xffFF6F61) // Màu button cho mi
            : const Color(0xff4DBFF9); // Màu button cho km

    emit(
      state.copyWith(
        visibilityColor: newColorStart,
        visibilityColorEnd: newColorEnd,
        buttonColor: newButtonColor,
        visibilityParameter: double.parse(newParameter.toStringAsFixed(2)),
        visibilityUnit: event.visibilityUnit.toLowerCase(),
      ),
    );
  }

  void onLocationHome(AppEvent event, Emitter<AppState> emit) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return; // Người dùng từ chối quyền
      }
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    emit(
      state.copyWith(
        longitude: position.latitude,
        latitude: position.longitude,
      ),
    );
  }
}
