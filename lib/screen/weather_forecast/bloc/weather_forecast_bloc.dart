import 'package:bloc/bloc.dart';

import 'weather_forecast_event.dart';
import 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastState.init()) {
    on<ChangeTemperatureEvent>(_onChangeParameterTemperature);
  }

  void _onChangeParameterTemperature(
    ChangeTemperatureEvent event,
    Emitter<WeatherForecastState> emit,
  ) {
    final double currentTemp = state.textTemperature;
    final double newParameter =
        event.checkButton
            ? (currentTemp * 1.8 + 32)
            : ((currentTemp - 32) / 1.8);
    emit(
      state.copyWith(
        textTemperature: newParameter,
        unit: event.checkButton ? 'F' : 'C',
        checkButton: event.checkButton, // Cập nhật trạng thái mới
      ),
    );
  }
}
