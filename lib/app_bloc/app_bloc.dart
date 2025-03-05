import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:geolocator/geolocator.dart';

import '../model/weather.dart';
import '../service/weather_service.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetThemeEvent>(_onChangeImageTheme);
    on<SetThermometerEvent>(_onChangeImageThermometer);
    on<SetVisibilityEvent>(_onChangeVisibility);
    on<SetLocationEvent>(onLocationHome);

    on<SetUvIndexMax>(_onUvIndex);
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
    if (state.rawVisibility != null) {
      final isSwitchingToMiles = event.visibilityUnit.toLowerCase() == "mi";
      double visibility =
          isSwitchingToMiles
              ? state.rawVisibility! *
                  0.000621371 // Mét sang mi
              : state.rawVisibility! / 1000; // Mét sang km
      visibility = double.parse(visibility.toStringAsFixed(2));

      // Cập nhật màu sắc dựa trên đơn vị mới
      final newColorStart =
          isSwitchingToMiles
              ? const Color(0xffFF6F61)
              : const Color(0xff5363F3);
      final newColorEnd =
          isSwitchingToMiles
              ? const Color(0xffFF9A8B)
              : const Color(0xff4BcFF9);
      final newButtonColor =
          isSwitchingToMiles
              ? const Color(0xffFF6F61)
              : const Color(0xff4DBFF9);

      emit(
        state.copyWith(
          visibilityColor: newColorStart,
          visibilityColorEnd: newColorEnd,
          buttonColor: newButtonColor,
          visibilityParameter: visibility,
          visibilityUnit: event.visibilityUnit.toLowerCase(),
        ),
      );
    } else {
      // Nếu rawVisibility chưa có, đặt giá trị mặc định
      emit(
        state.copyWith(
          visibilityParameter: 0,
          visibilityUnit: event.visibilityUnit.toLowerCase(),
        ),
      );
    }
  }

  void onLocationHome(AppEvent event, Emitter<AppState> emit) async {
    try {
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

      // Gọi API để lấy dữ liệu thời tiết
      final WeatherService weatherService = WeatherService();
      final Weather weatherData = await weatherService.fetchAllItems(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Lấy rawVisibility từ API (ở đơn vị mét)
      double? rawVisibility;
      if (weatherData.hourly != null &&
          weatherData.hourly!.visibility.isNotEmpty) {
        rawVisibility = weatherData.hourly!.visibility.last.toDouble();
      }

      // Tính visibilityParameter dựa trên visibilityUnit hiện tại
      double visibilityParameter = 0;
      if (rawVisibility != null) {
        final isMiles = state.visibilityUnit == "mi";
        visibilityParameter =
            isMiles
                ? rawVisibility *
                    0.000621371 // Mét sang mi
                : rawVisibility / 1000; // Mét sang km
        visibilityParameter = double.parse(
          visibilityParameter.toStringAsFixed(2),
        );
      }

      // Cập nhật màu sắc dựa trên đơn vị hiện tại
      final isMiles = state.visibilityUnit == "mi";
      final newColorStart =
          isMiles ? const Color(0xffFF6F61) : const Color(0xff5363F3);
      final newColorEnd =
          isMiles ? const Color(0xffFF9A8B) : const Color(0xff4BcFF9);
      final newButtonColor =
          isMiles ? const Color(0xffFF6F61) : const Color(0xff4DBFF9);

      // Cập nhật state với tất cả thông tin
      emit(
        state.copyWith(
          longitude: position.longitude,
          latitude: position.latitude,
          rawVisibility: rawVisibility,
          visibilityParameter: visibilityParameter,
          visibilityColor: newColorStart,
          visibilityColorEnd: newColorEnd,
          buttonColor: newButtonColor,
        ),
      );
    } catch (e) {
      print('Lỗi trong onLocationHome: $e');
      // Có thể emit trạng thái lỗi nếu cần
    }
  }

  void _onUvIndex(SetUvIndexMax event, Emitter<AppState> emit) async {
    try {
      print('Fetching UV Index...');
      final WeatherService weatherService = WeatherService();
      final Weather weatherData = await weatherService.fetchAllItems(
        latitude: state.latitude,
        longitude: state.longitude,
      );

      double? uvIndex;

      if (weatherData.daily != null &&
          weatherData.daily!.uvIndexMax.isNotEmpty) {
        uvIndex = weatherData.daily!.uvIndexMax.last.toDouble();
      } else {
        uvIndex = null;
        print('No UV Index available');
      }

      emit(state.copyWith(uvIndexMax: uvIndex));
    } catch (e) {
      print('Error fetching UV Index: $e');
      emit(state.copyWith(uvIndexMax: null));
    }
  }
}
