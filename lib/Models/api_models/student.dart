class Student {
  late String? studentId;
  late String? siblingId;
  late int? sid;
  late String? stdname;
  late String? chatid;
  late int? cgroupId;
  late String? cgroupName;
  late int? courseId;
  late String? courseName;
  late String? fatherGuardianName;
  late String? admissionNumber;
  late int? sectionId;
  late String? sectionName;
  late String? contacts;
  late String? billerId;
  late String? cityName;
  late String? schoolName;
  late String? schoolLogo;
  late String? schoolCode;
  late String? country;
  late String? email;

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
}
