import 'package:json_annotation/json_annotation.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: "forecastday")
  final List forecastList;

  ForecastModel(this.forecastList);

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
