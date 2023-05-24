import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/models.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  final String searchCity;

  const WeatherLoaded({required this.weatherModel, required this.searchCity});

  @override
  List<Object> get props => [weatherModel];
}

class WeatherError extends WeatherState {}
