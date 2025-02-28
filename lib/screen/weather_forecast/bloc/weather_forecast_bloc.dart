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
    final isCheckButton = state.checkButton;
    final newParameter =
        isCheckButton
            ? (state.textTemperature) * 1.8 + 32
            : ((state.textTemperature) - 32) / 1.8;
    emit(
      state.copyWith(
        textTemperature: newParameter,
        unit: isCheckButton ? 'F' : 'C',
        checkButton: isCheckButton,
      ),
    );
  }
}
