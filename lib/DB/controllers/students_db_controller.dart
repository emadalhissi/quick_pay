
import 'package:quick_pay/DB/db_operations.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:sqflite/sqflite.dart';

import '../db_provider.dart';

class StudentDbController implements DbOperations<Student> {
  final Database _database = DBProvider().database;

  @override
  Future<int> create(Student object) async {
    // INSERT INTO contact (name, phone) VALUES ('Name','1234');
    var queryResult = await _database.rawQuery('SELECT * FROM STUDENTS WHERE studentId="${object.studentId}"');

    if(queryResult.isEmpty)
      {
        return await _database.insert('STUDENTS', object.toMap());
      }
return 0;
    // return await _database.insert('STUDENTS', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM contacts;
    //DELETE FROM contacts WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'STUDENTS',
      where: 'id = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<bool> clearDb() async {
    int numberOfDeletedRows = await _database.delete(
      'STUDENTS'
    );
    return numberOfDeletedRows > 0;

  }


  @override
  Future<List<Student>> read() async {
    // TODO: implement read
    // SELECT * FROM contacts;
    print('check read');
    List<Map<String, dynamic>> rowsMap = await _database.query('STUDENTS');
    return rowsMap.map((Map<String, dynamic> rowMap) => Student.fromMap(rowMap)).toList();
  }

  @override
  Future<Student?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?;
    List<Map<String, dynamic>> rows =
    await _database.query('STUDENTS', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? Student.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(Student object) async {
    //UPDATE contacts SET name = 'NAME', phone = '1234';
    //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
    int numberOfUpdatedRows = await _database.update(
      'STUDENTS',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }

  @override
  Future<bool> deleteDateToUser(int id) {
    // TODO: implement deleteDateToUser
    throw UnimplementedError();
  }
}
