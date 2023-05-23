import 'package:sqflite/sqflite.dart';

abstract class Tables {
  static String fav = "fav";
}

class DatabaseService {
  static const int _version = 2;
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
        tempC TEXT,
        windMph TEXT,
        precipIn TEXT,
        pressureIn TEXT,
        tempF TEXT,
        condition TEXT,
        conditionIconUrl TEXT,
        $createdAt
      )
    """);
  }
}
