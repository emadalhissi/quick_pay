class FeeDataList {
  late int? sfeeId;
  late String? subFee;
  late int? fixedFee;
  late int? isMandatory;
  late int? orderBy;

  FeeDataList(
      {this.sfeeId,
      this.subFee,
      this.fixedFee,
      this.isMandatory,
      this.orderBy});

  FeeDataList.fromJson(Map<String, dynamic> json) {
    sfeeId = json['sfee_id'];
    subFee = json['sub_fee'];
    fixedFee = json['fixed_fee'];
    isMandatory = json['is_mandatory'];
    orderBy = json['order_by'];
  }

}
