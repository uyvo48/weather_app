import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:weather_app/screen/compass/bloc/compass_event.dart';
import 'package:weather_app/screen/compass/bloc/compass_state.dart';

class CompassBloc extends Bloc<DisplayCompassEvent, CompassState> {
  StreamSubscription? _compassSubscription;

  CompassBloc() : super(CompassState.init()) {
    on<DisplayCompassEvent>(_onDisplayHeading);

    _compassSubscription = FlutterCompass.events?.listen((event) {
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

  @override
  Future<void> close() {
    _compassSubscription?.cancel();
    return super.close();
  }
}
