import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/model/forecast_model.dart';
import 'package:weatherapp/model/models.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  @override
  List<Object> get props => [city, weatherStates];

  @JsonKey(name: "location")
  final CityModel city;
  @JsonKey(name: "current")
  final StateModel weatherStates;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  const WeatherModel(this.city, this.weatherStates, this.forecast);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
