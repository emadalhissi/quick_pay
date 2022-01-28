class Transaction {
  String? orderId;
  String? studentId;
  String? amount;
  String? paymentDate;
  String? fundTransStatus;
  String? transactionId;
  String? mode;

  Transaction(
      {this.orderId,
        this.studentId,
        this.amount,
        this.paymentDate,
        this.fundTransStatus,
        this.transactionId,
        this.mode});

  Transaction.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    studentId = json['student_id'];
    amount = json['amount'];
    paymentDate = json['payment_date'];
    fundTransStatus = json['fund_trans_status'];
    transactionId = json['transactionId'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['student_id'] = this.studentId;
    data['amount'] = this.amount;
    data['payment_date'] = this.paymentDate;
    data['fund_trans_status'] = this.fundTransStatus;
    data['transactionId'] = this.transactionId;
    data['mode'] = this.mode;
    return data;
  }
}