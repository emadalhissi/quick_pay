import 'package:quick_pay/Models/api_models/fee_list.dart';

class FeeFullJson {
  int? resultCode;
  List<FeeDataList>? data;
  String? notes;
  String? conveyancefee;
  String? conveyancetype;
  String? message;

  FeeFullJson(
      {this.resultCode,
        this.data,
        this.notes,
        this.conveyancefee,
        this.conveyancetype,
        this.message});

  FeeFullJson.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    if (json['data'] != null) {
      data = <FeeDataList>[];
      json['data'].forEach((v) {
        data!.add(new FeeDataList.fromJson(v));
      });
    }
    notes = json['notes'];
    conveyancefee = json['conveyancefee'];
    conveyancetype = json['conveyancetype'];
    message = json['message'];
  }

}