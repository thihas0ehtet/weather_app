import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/favorite/favorite_bloc.dart';
import 'package:weatherapp/bloc/favorite/favorite_event.dart';
import 'package:weatherapp/model/favorite_model.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/utils/utils.dart';

class FavoriteController {
  String tableName = Tables.fav;

  getData() async {
    final db = await DatabaseService.initDB();
    List<Map<String, dynamic>> list = await db.query(tableName);
    return list.map((data) => FavoriteModel.fromJson(data)).toList();
  }

  Future<void> handleAction(String method,
      {int? id, FavoriteModel? favorite}) async {
    final db = await DatabaseService.initDB();

    switch (method) {
      case ConstantUtils.postMethod:
        await db.insert(tableName, favorite!.toJson());
        break;

      case ConstantUtils.putMethod:
        await db.update(tableName, favorite!.toJson(),
            where: "id = ?", whereArgs: [id]);
        break;

      case ConstantUtils.deleteMethod:
        await db.delete(tableName, where: "id=?", whereArgs: [id]);
        break;
    }
  }

  Future<void> handleSaveFav(
      BuildContext context, WeatherModel weatherModel) async {
    final favBloc = BlocProvider.of<FavoriteBloc>(context);

    FavoriteModel favorite = FavoriteModel(
      name: weatherModel.city.name,
      region: weatherModel.city.region,
      country: weatherModel.city.country,
      lastUpdated: weatherModel.weatherStates.lastUpdated,
      tempC: weatherModel.weatherStates.tempC,
      windMph: weatherModel.weatherStates.windMph,
      precipIn: weatherModel.weatherStates.precipIn,
      pressureIn: weatherModel.weatherStates.pressureIn,
      tempF: weatherModel.weatherStates.tempF,
      condition: weatherModel.weatherStates.condition['text'],
      conditionIconUrl: weatherModel.weatherStates.condition['icon'],
      forecastList: weatherModel.forecast.forecastList
          .map((e) => {
                "date": e['date'],
                "condition": e['day']['condition']['text'],
                "conditionIcon": e['day']['condition']['icon'],
                "avgtemp_c": e['day']['avgtemp_c'],
                "avgtemp_f": e['day']['avgtemp_f'],
              })
          .toList(),
    );

    showSnackBar(context, 'Successfully saved as favorite!');
    await handleAction(ConstantUtils.postMethod, favorite: favorite);
    favBloc.add(const FetchFavourite());
  }

  Future<void> hanldeDeleteFav(BuildContext context, int id) async {
    final favBloc = BlocProvider.of<FavoriteBloc>(context);
    await handleAction(ConstantUtils.deleteMethod, id: id);
    favBloc.add(const FetchFavourite());
  }
}
