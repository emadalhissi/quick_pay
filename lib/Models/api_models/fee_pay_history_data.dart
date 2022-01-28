import 'package:quick_pay/Models/api_models/fee_pay_history_data_transaction_list.dart';

class FeePayHistoryData {
  List<Transaction>? transaction;
  String? fixedFee;
  int? paidFee;
  int? balance;
  String? orderId;

  FeePayHistoryData(
      {this.transaction,
        this.fixedFee,
        this.paidFee,
        this.balance,
        this.orderId});

  FeePayHistoryData.fromJson(Map<String, dynamic> json) {
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(new Transaction.fromJson(v));
      });
    }
    fixedFee = json['fixed_fee'];
    paidFee = json['paid_fee'];
    balance = json['balance'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.map((v) => v.toJson()).toList();
    }
    data['fixed_fee'] = this.fixedFee;
    data['paid_fee'] = this.paidFee;
    data['balance'] = this.balance;
    data['orderId'] = this.orderId;
    return data;
  }
}