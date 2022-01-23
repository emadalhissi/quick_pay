class DBStudent {
  late int id;
  late String? studentId;
  late String? stdname;
  late String? school_code;
  late String? school_name;
  late String? school_logo;

  DBStudent();

  // Read from map and convert to model
  DBStudent.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    studentId = rowMap['studentId'];
    stdname = rowMap['stdname'];
    school_code = rowMap['school_code'];
    school_name = rowMap['school_name'];
    school_logo = rowMap['school_logo'];
  }

  //  Save and convert from model to map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['studentId'] = studentId;
    rowMap['stdname'] = stdname;
    rowMap['school_code'] = school_code;
    rowMap['school_name'] = school_name;
    rowMap['school_logo'] = school_logo;
    return rowMap;
  }
}
