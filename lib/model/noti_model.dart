import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'noti_model.g.dart';

@JsonSerializable()
class NotiModel extends Equatable {
  final int? id;
  final String title;
  final String body;
  final String date;
  final String? createAt;

  const NotiModel(
      {this.id,
      required this.title,
      required this.body,
      required this.date,
      this.createAt});

  factory NotiModel.fromJson(Map<String, dynamic> json) =>
      _$NotiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotiModelToJson(this);

  @override
  List<Object> get props => [id!, title, body, createAt!];
}
