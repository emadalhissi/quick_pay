class InitiatePayment {
  int? resultCode;
  List? data;
  bool? paymentGateway;
  bool? upi;
  String? notes;
  String? message;

  InitiatePayment({
    this.resultCode,
    this.data,
    this.paymentGateway,
    this.upi,
    this.notes,
    this.message,
  });

  InitiatePayment.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(v);
      });
    }
    paymentGateway = json['PaymentGateway'];
    upi = json['upi'];
    notes = json['notes'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['PaymentGateway'] = this.paymentGateway;
    data['upi'] = this.upi;
    data['notes'] = this.notes;
    data['message'] = this.message;
    return data;
  }
}
