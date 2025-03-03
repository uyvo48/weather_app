import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String latitude;
  final String longitude;

  const HomeState({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [];
  factory HomeState.init() {
    return HomeState(latitude: "", longitude: "");
  }
  HomeState copyWith({String? latitude, String? longitude}) {
    return HomeState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
