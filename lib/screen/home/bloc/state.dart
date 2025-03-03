import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final double latitude;
  final double longitude;

  const HomeState({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [];
  factory HomeState.init() {
    return HomeState(latitude: 0, longitude: 0);
  }
  HomeState copyWith({double? latitude, double? longitude}) {
    return HomeState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
