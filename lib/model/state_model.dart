import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "wind_mph")
  final double windMph;
  @JsonKey(name: "precip_in")
  final double precipIn;
  @JsonKey(name: "pressure_in")
  final double pressureIn;
  @JsonKey(name: "temp_f")
  final double tempF;
  final Map condition;

  StateModel(this.lastUpdated, this.tempC, this.windMph, this.precipIn,
      this.pressureIn, this.tempF, this.condition);

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
