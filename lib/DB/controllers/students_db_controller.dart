import 'package:quick_pay/DB/db_operations.dart';
import 'package:quick_pay/DB/db_provider.dart';
import 'package:quick_pay/Models/db_models/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentsDbController implements DbOperations<DBStudent> {
  final Database _database = DBProvider().getDatabase;

  @override
  Future<int> create(DBStudent student) async {
    int newRow = await _database.insert('STUDENTS', student.toMap());
    return newRow;
  }

  @override
  Future<bool> delete(int id) async {
    int numberOfDeletedRows = await _database.delete(
      'STUDENTS',
      where: 'id = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  // Read All
  Future<List<DBStudent>> read() async {
    List<Map<String, dynamic>> mapRows = await _database.query('STUDENTS');
    return mapRows.map((mapRow) => DBStudent.fromMap(mapRow)).toList();
  }

  @override
  // Read item based on ID
  Future<DBStudent?> show(int id) async {
    List<Map<String, dynamic>> row = await _database.query(
      'STUDENTS',
      where: 'id = ?',
      whereArgs: [id],
    );
    return row.isNotEmpty ? DBStudent.fromMap(row.first) : null;
  }

  @override
  Future<bool> update(DBStudent object) async {
    int numberOfUpdatedRows = await _database.update(
      'STUDENTS',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }
}
