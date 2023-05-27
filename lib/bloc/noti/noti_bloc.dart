import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/controllers/noti_controller.dart';

import './bloc.dart';

class NotiBloc extends Bloc<NotiEvent, NotiState> {
  NotiBloc() : super(NotiEmpty()) {
    on<FetchNoti>((event, emit) async {
      final NotiController notiController = NotiController();

      emit(NotiLoading());

      try {
        final response = await notiController.getData();
        emit(NotiLoaded(notiList: response));
      } on SocketException {
        emit(NotiError());
      } on Exception {
        emit(NotiError());
      }
    });
  }
}
