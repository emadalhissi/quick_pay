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
  late String? email_address;
  late String school_code;
  late String? country;
  late String? biller_id;
  late String? city_name;
  late String? school_name;
  late String? school_logo;
  late String? email;

  late int? cgroupId;
  late String? cgroupName;
  late int? courseId;
  late int? sectionId;
  late String? sectionName;

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

    school_code = json['school_code'];
    country = json['country'];
    biller_id = json['biller_id'];
    city_name = json['city_name'];
    school_name = json['school_name'];
    school_logo = json['school_logo'];
    email = json['email'];
    email_address = json['email_address'];
    cgroupId = json['cgroup_id'];
    cgroupName = json['cgroup_name'];
    courseId = json['course_id'];
    sectionId = json['section_id'];
    sectionName = json['section_name'];
  }

  Student.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    sibling_id = json['siblingId'];
    sid = json['sid'];
    stdname = json['stdname'];
    course_name = json['courseName'];
    father_guardian_name = json['fatherGuardianName'];
    chatid = json['chatid'];
    admission_number = json['admissionNumber'];
    contacts = json['contacts'];
    email_address = json['emailAddress'];
    school_code = json['schoolCode'];
    country = json['country'];
    biller_id = json['billerId'];
    city_name = json['cityName'];
    school_name = json['schoolName'];
    school_logo = json['schoolLogo'];
    email = json['email'];

    cgroupId = json['cgroupId'];
    cgroupName = json['cgroupName'];
    courseId = json['courseId'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['siblingId'] = this.sibling_id;
    data['sid'] = this.sid;
    data['stdname'] = this.stdname;
    data['courseName'] = this.course_name;
    data['fatherGuardianName'] = this.father_guardian_name;
    data['chatid'] = this.chatid;
    data['admissionNumber'] = this.admission_number;
    data['contacts'] = this.contacts;
    data['emailAddress'] = this.email_address;
    data['schoolCode'] = this.school_code;
    data['country'] = this.country;
    data['billerId'] = this.biller_id;
    data['cityName'] = this.city_name;
    data['schoolName'] = this.school_name;
    data['schoolLogo'] = this.school_logo;
    data['email'] = this.email;

    data['cgroupId'] = this.cgroupId;
    data['cgroupName'] = this.cgroupName;
    data['courseId'] = this.courseId;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;

    return data;
  }
}