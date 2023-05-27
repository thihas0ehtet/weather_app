import 'package:equatable/equatable.dart';

abstract class NotiEvent extends Equatable {
  const NotiEvent();
}

class FetchNoti extends NotiEvent {
  const FetchNoti();

  @override
  List<Object> get props => [];
}
