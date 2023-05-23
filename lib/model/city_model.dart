import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends Equatable {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localtime;
  @JsonKey(name: "tz_id")
  final String timeZone;

  const CityModel(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      required this.localtime,
      required this.timeZone});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  List<Object> get props =>
      [name, region, country, lat, lon, localtime, timeZone];
}
