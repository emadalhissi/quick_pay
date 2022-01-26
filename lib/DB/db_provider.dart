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
            "siblingId TEXT NOT NULL,"
            "sid Integer NOT NULL,"
            "stdname TEXT NOT NULL,"
            "chatid TEXT NOT NULL,"
            "cgroupId INTEGER NOT NULL,"
            "cgroupName TEXT NOT NULL,"
            "courseId INTEGER NOT NULL,"
            "courseName TEXT NOT NULL,"
            "fatherGuardianName TEXT NOT NULL,"
            "admissionNumber TEXT NOT NULL,"
            "sectionId INTEGER NOT NULL,"
            "sectionName TEXT NOT NULL,"
            "contacts TEXT NOT NULL,"
            "billerId TEXT NOT NULL,"
            "cityName TEXT NOT NULL,"
            "schoolName TEXT NOT NULL,"
            "schoolLogo TEXT NOT NULL,"
            "schoolCode TEXT NOT NULL,"
            "country TEXT NOT NULL,"
            "email TEXT NOT NULL"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
