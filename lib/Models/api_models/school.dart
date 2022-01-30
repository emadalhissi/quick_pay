class School {
  int? schoolId;
  String? schoolName;
  int? districtId;
  String? url;

  School({this.schoolId, this.schoolName, this.districtId, this.url});

  School.fromJson(Map<String, dynamic> json) {
    schoolId = json['school_id'];
    schoolName = json['school_name'];
    districtId = json['district_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school_id'] = this.schoolId;
    data['school_name'] = this.schoolName;
    data['district_id'] = this.districtId;
    data['url'] = this.url;
    return data;
  }
}