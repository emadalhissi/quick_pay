class SubFeeList {
  int? amount;
  int? subFeeId;

  SubFeeList({this.amount, this.subFeeId});

  SubFeeList.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    subFeeId = json['sub_fee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['sub_fee_id'] = this.subFeeId;
    return data;
  }
}