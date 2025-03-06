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
    on<SetHumidity>(_onHumidity);
    on<SetAirQuality>(_onAirQuality);
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

      // Trích xuất rawVisibility và uvIndexMax từ weatherData
      double? rawVisibility;
      if (weatherData.hourly != null &&
          weatherData.hourly!.visibility.isNotEmpty) {
        rawVisibility = weatherData.hourly!.visibility.last.toDouble();
      }

      double? uvIndex;
      if (weatherData.daily != null &&
          weatherData.daily!.uvIndexMax.isNotEmpty) {
        uvIndex = weatherData.daily!.uvIndexMax.last.toDouble();
      }
      double? humidity;
      if (weatherData.daily != null &&
          weatherData.hourly!.relativeHumidity2M.isNotEmpty) {
        humidity = weatherData.hourly!.relativeHumidity2M.last.toDouble();
      }
      double? airQuality;
      if (weatherData.daily != null &&
          weatherData.hourly!.relativeHumidity2M.isNotEmpty) {
        humidity = weatherData.hourly!.relativeHumidity2M.last.toDouble();
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

      emit(
        state.copyWith(
          humidity: humidity,
          weather: weatherData,
          longitude: position.longitude,
          latitude: position.latitude,
          rawVisibility: rawVisibility,
          visibilityParameter: visibilityParameter,
          visibilityColor: newColorStart,
          visibilityColorEnd: newColorEnd,
          buttonColor: newButtonColor,
          uvIndexMax: uvIndex,
        ),
      );
    } catch (e) {
      print('Lỗi trong onLocationHome: $e');
    }
  }

  void _onUvIndex(SetUvIndexMax event, Emitter<AppState> emit) {
    if (state.weather != null &&
        state.weather!.daily != null &&
        state.weather!.daily!.uvIndexMax.isNotEmpty) {
      final uvIndex = state.weather!.daily!.uvIndexMax.last.toDouble();
      emit(state.copyWith(uvIndexMax: uvIndex));
    } else {
      emit(state.copyWith(uvIndexMax: null));
    }
  }

  void _onHumidity(SetHumidity event, Emitter<AppState> emit) {
    if (state.weather != null &&
        state.weather!.hourly != null &&
        state.weather!.hourly!.relativeHumidity2M.isNotEmpty) {
      final humidity =
          state.weather!.hourly!.relativeHumidity2M.last.toDouble();
      emit(state.copyWith(humidity: humidity));
    } else {
      emit(state.copyWith(humidity: null));
    }
  }

  void _onAirQuality(SetAirQuality event, Emitter<AppState> emit) {}
}
