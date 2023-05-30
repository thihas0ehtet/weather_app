import 'package:weatherapp/model/noti_model.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/utils/utils.dart';

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
    String title,
    String body,
  ) async {
    NotiModel noti = NotiModel(
        title: title,
        body: body,
        date: fullDateAndTime(DateTime.now().toString()));
    await handleAction(ConstantUtils.postMethod, noti: noti);
  }
}
