import 'package:flutter/material.dart';
import 'package:quick_pay/DB/controllers/students_db_controller.dart';
import 'package:quick_pay/Models/db_models/student.dart';

class StudentsProvider extends ChangeNotifier {

  List<DBStudent> students = <DBStudent>[];

  final StudentsDbController _studentsDbController = StudentsDbController();

  Future<void> read() async {
    students = await _studentsDbController.read();
    notifyListeners();
  }

  Future <bool> create(DBStudent student) async {
    int newRowId = await _studentsDbController.create(student);
    if(newRowId != 0) {
      student.id = newRowId;
      students.add(student);
      notifyListeners();
      // student.id = await db.insert(tableStudent, student.toMap());
      // return student;
    }
    return newRowId != 0;
  }

  Future<bool> delete(int id) async {
    bool deleted = await _studentsDbController.delete(id);

    // Method 1
    if(deleted) {
      int index = students.indexWhere((element) => element.id == id);
      if(index != -1) {
        students.removeAt(index);
        notifyListeners();
      }
    }

    // Method 2
    // if(deleted) {
    //   contacts.removeWhere((element) => element.id == id);
    // }

    return deleted;
  }

  Future<bool> update(DBStudent student) async {
    bool updated = await _studentsDbController.update(student);
    if(updated) {
      int index = students.indexWhere((element) => element.id == student.id);
      if(index != -1) {
        students[index] = student;
        notifyListeners();
      }
    }
    return updated;
  }


}