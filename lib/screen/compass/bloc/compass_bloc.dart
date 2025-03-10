import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:weather_app/screen/compass/bloc/compass_event.dart';
import 'package:weather_app/screen/compass/bloc/compass_state.dart';

class CompassBloc extends Bloc<DisplayCompassEvent, CompassState> {
  CompassBloc() : super(CompassState.init()) {
    on<DisplayCompassEvent>(_onDisplayHeading);

    FlutterCompass.events?.listen((event) {
      if (event.heading != null) {
        add(DisplayCompassEvent(heading: event.heading!));
      }
    });
  }

  void _onDisplayHeading(
    DisplayCompassEvent event,
    Emitter<CompassState> emit,
  ) {
    final double heading = event.heading;
    final double rotationAngle = heading * (pi / 180) * -1;
    final int displayHeading = heading.ceil();

    emit(
      state.copyWith(
        heading: heading,
        rotationAngle: rotationAngle,
        displayHeading: displayHeading,
      ),
    );
  }
}
