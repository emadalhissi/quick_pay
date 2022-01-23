import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  late Database _database;

  static final DBProvider _instance = DBProvider._internal();

  factory DBProvider() {
    return _instance;
  }

  DBProvider._internal();

  Database get getDatabase => _database;

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db_sql.sql');

    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE STUDENTS ("
            "id integer PRIMARY KEY AUTOINCREMENT,"
            "studentId TEXT NOT NULL,"
            "stdname TEXT NOT NULL,"
            "school_code TEXT NOT NULL,"
            "school_name NULL,"
            "school_logo NULL,"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
    return _database;
  }
}
