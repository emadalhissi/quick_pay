class District {
  int? districtId;
  String? districtName;
  int? stateId;

  District({this.districtId, this.districtName, this.stateId});

  District.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    districtName = json['district_name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['state_id'] = this.stateId;
    return data;
  }
}