import 'package:app_lunch/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'lanches_db');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTable);
        db.execute(insert);
      });
    }

    return _db;
  }
}
