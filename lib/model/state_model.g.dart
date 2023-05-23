// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      json['last_updated'] as String,
      (json['temp_c'] as num).toDouble(),
      (json['wind_mph'] as num).toDouble(),
      (json['precip_in'] as num).toDouble(),
      (json['pressure_in'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      json['condition'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'wind_mph': instance.windMph,
      'precip_in': instance.precipIn,
      'pressure_in': instance.pressureIn,
      'temp_f': instance.tempF,
      'condition': instance.condition,
    };
