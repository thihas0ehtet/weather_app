// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lastUpdated: json['lastUpdated'] as String,
      tempC: (json['tempC'] as num).toDouble(),
      windMph: (json['windMph'] as num).toDouble(),
      precipIn: (json['precipIn'] as num).toDouble(),
      pressureIn: (json['pressureIn'] as num).toDouble(),
      tempF: (json['tempF'] as num).toDouble(),
      condition: json['condition'] as String,
      conditionIconUrl: json['conditionIconUrl'] as String,
      forecastList: List<Map<String, dynamic>>.from(
          jsonDecode(json["forecastList"]).map((x) => x)).toList(),
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lastUpdated': instance.lastUpdated,
      'tempC': instance.tempC,
      'windMph': instance.windMph,
      'precipIn': instance.precipIn,
      'pressureIn': instance.pressureIn,
      'tempF': instance.tempF,
      'condition': instance.condition,
      'conditionIconUrl': instance.conditionIconUrl,
      'forecastList': jsonEncode(instance.forecastList),
    };
