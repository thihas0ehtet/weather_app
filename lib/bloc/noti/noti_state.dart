import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/noti_model.dart';

abstract class NotiState extends Equatable {
  const NotiState();

  @override
  List<Object> get props => [];
}

class NotiEmpty extends NotiState {}

class NotiLoading extends NotiState {}

class NotiLoaded extends NotiState {
  final List<NotiModel> notiList;

  const NotiLoaded({required this.notiList});

  @override
  List<Object> get props => [NotiModel];
}

class NotiError extends NotiState {}
