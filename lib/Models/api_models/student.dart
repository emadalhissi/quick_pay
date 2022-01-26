class Student {
  late int id;
  late String studentId;
  late String siblingId;
  late int sid;
  late String stdname;
  late String chatid;
  late int cgroupId;
  late String cgroupName;
  late int courseId;
  late String courseName;
  late String fatherGuardianName;
  late String admissionNumber;
  late int sectionId;
  late String sectionName;
  late String contacts;
  late String billerId;
  late String cityName;
  late String schoolName;
  late String schoolLogo;
  late String schoolCode;
  late String country;
  late String email;

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    siblingId = json['sibling_id'];
    sid = json['sid'];
    stdname = json['stdname'];
    chatid = json['chatid'];
    cgroupId = json['cgroup_id'];
    cgroupName = json['cgroup_name'];
    courseId = json['course_id'];
    courseName = json['course_name'];
    fatherGuardianName = json['father_guardian_name'];
    admissionNumber = json['admission_number'];
    sectionId = json['section_id'];
    sectionName = json['section_name'];
    contacts = json['contacts'];
    billerId = json['biller_id'];
    cityName = json['city_name'];
    schoolName = json['school_name'];
    schoolLogo = json['school_logo'];
    schoolCode = json['school_code'];
    country = json['country'];
    email = json['email'];
  }
  Student.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    siblingId = json['siblingId'];
    sid = json['sid'];
    stdname = json['stdname'];
    chatid = json['chatid'];
    cgroupId = json['cgroupId'];
    cgroupName = json['cgroupName'];
    courseId = json['courseId'];
    courseName = json['courseName'];
    fatherGuardianName = json['fatherGuardianName'];
    admissionNumber = json['admissionNumber'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    contacts = json['contacts'];
    billerId = json['billerId'];
    cityName = json['cityName'];
    schoolName = json['schoolName'];
    schoolLogo = json['schoolLogo'];
    schoolCode = json['schoolCode'];
    country = json['country'];
    email = json['email'];
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['siblingId'] = this.siblingId;
    data['sid'] = this.sid;
    data['stdname'] = this.stdname;
    data['chatid'] = this.chatid;
    data['cgroupId'] = this.cgroupId;
    data['cgroupName'] = this.cgroupName;
    data['courseId'] = this.courseId;
    data['courseName'] = this.courseName;
    data['fatherGuardianName'] = this.fatherGuardianName;
    data['admissionNumber'] = this.admissionNumber;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['contacts'] = this.contacts;
    data['billerId'] = this.billerId;
    data['cityName'] = this.cityName;
    data['schoolName'] = this.schoolName;
    data['schoolLogo'] = this.schoolLogo;
    data['schoolCode'] = this.schoolCode;
    data['country'] = this.country;
    data['email'] = this.email;
    return data;
  }
}
