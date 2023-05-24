import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourite_model.g.dart';

@JsonSerializable()
class FavouriteModel extends Equatable {
  final int? id;
  final String name;
  final String region;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double windMph;
  final double precipIn;
  final double pressureIn;
  final double tempF;
  final String condition;
  final String conditionIconUrl;
  final List<Map<String, dynamic>> forecastList;

  const FavouriteModel({
    this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.windMph,
    required this.precipIn,
    required this.pressureIn,
    required this.tempF,
    required this.condition,
    required this.conditionIconUrl,
    required this.forecastList,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);

  @override
  List<Object> get props => [
        name,
        region,
        country,
        lastUpdated,
        tempC,
        windMph,
        precipIn,
        pressureIn,
        tempF,
        condition,
        conditionIconUrl,
        forecastList
      ];
}
