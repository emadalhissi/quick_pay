// class StudentDetails {
//   String? studentId;
//   String? siblingId;
//   int? sid;
//   String? stdname;
//   String? chatid;
//   int? cgroupId;
//   String? cgroupName;
//   int? courseId;
//   String? courseName;
//   String? fatherGuardianName;
//   String? admissionNumber;
//   int? sectionId;
//   String? sectionName;
//   String? contacts;
//   String? billerId;
//   String? cityName;
//   String? schoolName;
//   String? schoolLogo;
//   String? schoolCode;
//   String? country;
//   String? email;
//
//   StudentDetails({
//     this.studentId,
//     this.siblingId,
//     this.sid,
//     this.stdname,
//     this.chatid,
//     this.cgroupId,
//     this.cgroupName,
//     this.courseId,
//     this.courseName,
//     this.fatherGuardianName,
//     this.admissionNumber,
//     this.sectionId,
//     this.sectionName,
//     this.contacts,
//     this.billerId,
//     this.cityName,
//     this.schoolName,
//     this.schoolLogo,
//     this.schoolCode,
//     this.country,
//     this.email,
//   });
//
//   StudentDetails.fromJson(Map<String, dynamic> json) {
//     studentId = json['studentId'];
//     siblingId = json['sibling_id'];
//     sid = json['sid'];
//     stdname = json['stdname'];
//     chatid = json['chatid'];
//     cgroupId = json['cgroup_id'];
//     cgroupName = json['cgroup_name'];
//     courseId = json['course_id'];
//     courseName = json['course_name'];
//     fatherGuardianName = json['father_guardian_name'];
//     admissionNumber = json['admission_number'];
//     sectionId = json['section_id'];
//     sectionName = json['section_name'];
//     contacts = json['contacts'];
//     billerId = json['biller_id'];
//     cityName = json['city_name'];
//     schoolName = json['school_name'];
//     schoolLogo = json['school_logo'];
//     schoolCode = json['school_code'];
//     country = json['country'];
//     email = json['email'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['studentId'] = this.studentId;
//     data['sibling_id'] = this.siblingId;
//     data['sid'] = this.sid;
//     data['stdname'] = this.stdname;
//     data['chatid'] = this.chatid;
//     data['cgroup_id'] = this.cgroupId;
//     data['cgroup_name'] = this.cgroupName;
//     data['course_id'] = this.courseId;
//     data['course_name'] = this.courseName;
//     data['father_guardian_name'] = this.fatherGuardianName;
//     data['admission_number'] = this.admissionNumber;
//     data['section_id'] = this.sectionId;
//     data['section_name'] = this.sectionName;
//     data['contacts'] = this.contacts;
//     data['biller_id'] = this.billerId;
//     data['city_name'] = this.cityName;
//     data['school_name'] = this.schoolName;
//     data['school_logo'] = this.schoolLogo;
//     data['school_code'] = this.schoolCode;
//     data['country'] = this.country;
//     data['email'] = this.email;
//     return data;
//   }
// }
