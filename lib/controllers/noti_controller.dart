import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/noti/noti_event.dart';
import 'package:weatherapp/model/noti_model.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/utils/utils.dart';

import '../bloc/noti/noti_bloc.dart';

class NotiController {
  String tableName = Tables.noti;

  getData() async {
    final db = await DatabaseService.initDB();
    List<Map<String, dynamic>> list = await db.query(tableName);
    return list.reversed.map((data) => NotiModel.fromJson(data)).toList();
  }

  Future<void> handleAction(String method, {int? id, NotiModel? noti}) async {
    final db = await DatabaseService.initDB();

    switch (method) {
      case ConstantUtils.postMethod:
        await db.insert(tableName, noti!.toJson());
        break;

      case ConstantUtils.putMethod:
        await db.update(tableName, noti!.toJson(),
            where: "id = ?", whereArgs: [id]);
        break;

      case ConstantUtils.deleteMethod:
        await db.delete(tableName, where: "id=?", whereArgs: [id]);
        break;
    }
  }

  Future<void> handleSaveNoti(
      BuildContext context, String title, String body) async {
    NotiModel noti = NotiModel(
        title: title,
        body: body,
        date: fullDateAndTime(DateTime.now().toString()));

    await handleAction(ConstantUtils.postMethod, noti: noti);
  }

  Future<void> hanldeDeleteNoti(BuildContext context, int id) async {
    final notiBloc = BlocProvider.of<NotiBloc>(context);
    await handleAction(ConstantUtils.deleteMethod, id: id);
    notiBloc.add(const FetchNoti());
  }
}
