import 'package:weatherapp/model/favourite_model.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/utils/constants.dart';

class FavouriteController {
  String tableName = Tables.fav;

  getData() async {
    final db = await DatabaseService.initDB();
    List<Map<String, dynamic>> list = await db.query(tableName);
    return list.map((data) => FavouriteModel.fromJson(data)).toList();
  }

  Future<void> handleAction(String method,
      {int? id, FavouriteModel? favourite}) async {
    final db = await DatabaseService.initDB();

    switch (method) {
      case ConstantUtils.postMethod:
        await db.insert(tableName, favourite!.toJson());
        break;

      case ConstantUtils.putMethod:
        await db.update(tableName, favourite!.toJson(),
            where: "id = ?", whereArgs: [id]);
        break;

      case ConstantUtils.deleteMethod:
        await db.delete(tableName, where: "id=?", whereArgs: [id]);
        break;
    }

    getData();
  }
}
