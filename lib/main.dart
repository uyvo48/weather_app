import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/screen/compass/bloc/compass_bloc.dart';
import 'package:weather_app/screen/weather_forecast/bloc/weather_forecast_bloc.dart';

import 'app_bloc/app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => WeatherForecastBloc()),
        BlocProvider(create: (context) => CompassBloc()),
      ],
      // child: MaterialApp(home: WindView()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
