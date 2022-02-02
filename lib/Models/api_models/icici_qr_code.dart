class IcIciQRCode {
  String? merchantId;
  String? terminalId;
  String? success;
  String? response;
  String? message;
  String? refId;
  String? merchantTranId;
  String? qrUrl;

  IcIciQRCode({
    this.merchantId,
    this.terminalId,
    this.success,
    this.response,
    this.message,
    this.refId,
    this.merchantTranId,
    this.qrUrl,
  });

  IcIciQRCode.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchantId'];
    terminalId = json['terminalId'];
    success = json['success'];
    response = json['response'];
    message = json['message'];
    refId = json['refId'];
    merchantTranId = json['merchantTranId'];
    qrUrl = json['qrUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchantId'] = this.merchantId;
    data['terminalId'] = this.terminalId;
    data['success'] = this.success;
    data['response'] = this.response;
    data['message'] = this.message;
    data['refId'] = this.refId;
    data['merchantTranId'] = this.merchantTranId;
    data['qrUrl'] = this.qrUrl;
    return data;
  }
}
