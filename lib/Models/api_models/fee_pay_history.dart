import 'package:quick_pay/Models/api_models/fee_pay_history_data.dart';

class FeePayHistory {
  int? resultCode;
  FeePayHistoryData? feePayHistoryData;
  String? message;

  FeePayHistory({this.resultCode, this.feePayHistoryData, this.message});

  FeePayHistory.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    feePayHistoryData = json['data'] != null ? new FeePayHistoryData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.feePayHistoryData != null) {
      data['data'] = this.feePayHistoryData!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}



