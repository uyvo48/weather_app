import 'package:equatable/equatable.dart';

sealed class CompassEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DisplayCompassEvent extends CompassEvent {
  final double heading;

  DisplayCompassEvent({required this.heading});

  @override
  List<Object?> get props => [heading];
}
