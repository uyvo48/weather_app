import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    on<LocationInitEvent>(onLocationHome);
  }

  Future<void> onLocationHome(
    LocationInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.https('example.com', 'whatsit/create'),
        body: {'name': 'doodle', 'color': 'blue'},
      );
    } finally {
      client.close();
    }
  }
}
