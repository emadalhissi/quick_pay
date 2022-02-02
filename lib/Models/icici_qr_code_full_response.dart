import 'package:quick_pay/Models/api_models/icici_qr_code.dart';

class IcIciQRCodeFullResponse {
  int? resultCode;
  IcIciQRCode? data;
  String? notes;
  String? message;

  IcIciQRCodeFullResponse(
      {this.resultCode, this.data, this.notes, this.message});

  IcIciQRCodeFullResponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new IcIciQRCode.fromJson(json['data']) : null;
    notes = json['notes'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['notes'] = this.notes;
    data['message'] = this.message;
    return data;
  }
}