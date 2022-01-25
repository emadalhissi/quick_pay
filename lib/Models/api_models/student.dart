class Student {
  late int id;
  late String studentId;
  late String sibling_id;
  late int sid;
  late String stdname;
  late String course_name;
  late String father_guardian_name;
  late String chatid;
  late String admission_number;
  late String contacts;
  late String email_address;
  late String school_code;
  late String? country;
  late String? biller_id;
  late String? city_name;
  late String? school_name;
  late String? school_logo;
  late String? email;

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    sibling_id = json['sibling_id'];
    sid = json['sid'];
    stdname = json['stdname'];
    course_name = json['course_name'];
    father_guardian_name = json['father_guardian_name'];
    chatid = json['chatid'];
    admission_number = json['admission_number'];
    contacts = json['contacts'];
    email_address = json['email_address'];
    school_code = json['school_code'];
    country = json['country'];
    biller_id = json['biller_id'];
    city_name = json['city_name'];
    school_name = json['school_name'];
    school_logo = json['school_logo'];
    email = json['email'];
  }

  Student.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    sibling_id = json['sibling_id'];
    sid = json['sid'];
    stdname = json['stdname'];
    course_name = json['courseName'];
    father_guardian_name = json['father_guardian_name'];
    chatid = json['chatid'];
    admission_number = json['admission_number'];
    contacts = json['contacts'];
    email_address = json['email_address'];
    school_code = json['school_code'];
    country = json['country'];
    biller_id = json['biller_id'];
    city_name = json['city_name'];
    school_name = json['school_name'];
    school_logo = json['school_logo'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['sibling_id'] = this.sibling_id;
    data['sid'] = this.sid;
    data['stdname'] = this.stdname;
    data['course_name'] = this.course_name;
    data['father_guardian_name'] = this.father_guardian_name;
    data['chatid'] = this.chatid;
    data['admission_number'] = this.admission_number;
    data['contacts'] = this.contacts;
    data['email_address'] = this.email_address;
    data['school_code'] = this.school_code;
    data['country'] = this.country;
    data['biller_id'] = this.biller_id;
    data['city_name'] = this.city_name;
    data['school_name'] = this.school_name;
    data['school_logo'] = this.school_logo;
    data['email'] = this.email;
    return data;
  }
}
