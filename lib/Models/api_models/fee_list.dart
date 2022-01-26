class FeeList {
  late int? sfeeId;
  late String? subFee;
  late int? fixedFee;
  late int? isMandatory;
  late int? orderBy;

  FeeList(
      {this.sfeeId,
      this.subFee,
      this.fixedFee,
      this.isMandatory,
      this.orderBy});

  FeeList.fromJson(Map<String, dynamic> json) {
    sfeeId = json['sfee_id'];
    subFee = json['sub_fee'];
    fixedFee = json['fixed_fee'];
    isMandatory = json['is_mandatory'];
    orderBy = json['order_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sfee_id'] = this.sfeeId;
    data['sub_fee'] = this.subFee;
    data['fixed_fee'] = this.fixedFee;
    data['is_mandatory'] = this.isMandatory;
    data['order_by'] = this.orderBy;
    return data;
  }
}
