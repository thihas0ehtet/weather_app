import 'package:sqflite/sqflite.dart';

abstract class Tables {
  static String fav = "fav";
  static String noti = "noti";
}

class DatabaseService {
  static const int _version = 1;
  static const String _database = "Weather.db";

  static Future<Database> initDB() async {
    String path = "${await getDatabasesPath()}/$_database";
    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  static Future<void> createTables(Database database) async {
    String id = "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL";
    String createdAt = "createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP";

    await database.execute("""
      CREATE TABLE ${Tables.fav} (
        $id ,
        name TEXT,
        region TEXT,
        country TEXT,
        lastUpdated TEXT,
        tempC REAL,
        windMph REAL,
        precipIn REAL,
        pressureIn REAL,
        tempF REAL,
        condition TEXT,
        conditionIconUrl TEXT,
         forecastList TEXT,
        $createdAt
      )
    """);

    await database.execute("""
      CREATE TABLE ${Tables.noti} (
        $id ,
        title TEXT,
        body TEXT,
        isRead BOOLEAN,
        $createdAt
      )
    """);
  }
}
