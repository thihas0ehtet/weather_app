// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotiModel _$NotiModelFromJson(Map<String, dynamic> json) => NotiModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NotiModelToJson(NotiModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
    };
