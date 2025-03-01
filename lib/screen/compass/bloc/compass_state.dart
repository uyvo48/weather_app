import 'package:equatable/equatable.dart';

class CompassState extends Equatable {
  final double heading;
  final int displayHeading;
  final double rotationAngle;

  const CompassState({
    required this.heading,
    required this.displayHeading,
    required this.rotationAngle,
  });
  factory CompassState.init() {
    return CompassState(heading: 0, displayHeading: 0, rotationAngle: 0);
  }
  CompassState copyWith({
    double? heading,
    double? rotationAngle,
    int? displayHeading,
  }) {
    return CompassState(
      heading: heading ?? this.heading,
      rotationAngle: rotationAngle ?? this.rotationAngle,
      displayHeading: displayHeading ?? this.displayHeading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [heading, rotationAngle, displayHeading];
}
