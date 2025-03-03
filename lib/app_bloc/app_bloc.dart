import 'dart:convert';
import 'dart:ui';

import 'package:bloc/src/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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
    add(SetLocationEvent());
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

  void _onChangeVisibility(
    SetVisibilityEvent event,
    Emitter<AppState> emit,
  ) async {
    final isSwitchingToMiles = event.visibilityUnit.toLowerCase() == "mi";

    final response = await http.get(
      Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=${state.latitude}'
        '&longitude=${state.longitude}&hourly=visibility',
      ),
    );
    final newParameter =
        isSwitchingToMiles
            ? event.visibilityParameter * 0.621371
            : event.visibilityParameter / 0.621371;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newParameter = data['hourly']['visibility'];
      final visibilityParameter = newParameter.last;

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
          visibilityParameter: visibilityParameter,
          visibilityUnit: event.visibilityUnit.toLowerCase(),
        ),
      );
    }
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
        longitude: position.longitude, // Đúng
        latitude: position.latitude,
      ),
    );
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
