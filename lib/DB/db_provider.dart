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

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db_sql.sql');

    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE STUDENTS ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "studentId TEXT NOT NULL,"
            "sibling_id TEXT NOT NULL,"
            "sid Integer NOT NULL,"
            "stdname TEXT NOT NULL,"
            "course_name TEXT NOT NULL,"
            "father_guardian_name TEXT NOT NULL,"
            "chatid TEXT NOT NULL,"
            "admission_number TEXT NOT NULL,"
            "contacts TEXT NOT NULL,"
            "email_address TEXT NOT NULL,"
            "school_code TEXT NOT NULL,"
            "country TEXT,"
            "biller_id TEXT,"
            "city_name TEXT,"
            "school_name TEXT,"
            "school_logo TEXT,"
            "email TEXT"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
