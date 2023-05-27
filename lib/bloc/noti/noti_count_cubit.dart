import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/controllers/noti_controller.dart';

class NotiCountCubit extends Cubit<int> {
  NotiCountCubit() : super(0);

  Future<void> changeNotiCount() async {
    final NotiController notiController = NotiController();
    final res = await notiController.getData();
    emit(res.length);
  }
}
