import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:weatherapp/services/api_service.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService apiService;

  WeatherBloc({required this.apiService}) : super(WeatherEmpty()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final response = await apiService.getWeather(event.city);
        emit(WeatherLoaded(weatherModel: response));
      } on SocketException {
        emit(WeatherError());
      } on Exception {
        emit(WeatherError());
      }
    });
  }
}
