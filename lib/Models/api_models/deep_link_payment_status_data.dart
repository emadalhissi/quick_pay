class DeepLinkPaymentStatusData {
  String? orderId;
  String? transactionId;
  String? platformBillID;
  String? studentId;
  String? paidamount;
  String? status;
  String? transactionAt;
  String? paymentType;

  DeepLinkPaymentStatusData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    transactionId = json['transaction_id'];
    platformBillID = json['platformBillID'];
    studentId = json['student_id'];
    paidamount = json['paidamount'];
    status = json['status'];
    transactionAt = json['transaction_at'];
    paymentType = json['payment_type'];
  }
}
