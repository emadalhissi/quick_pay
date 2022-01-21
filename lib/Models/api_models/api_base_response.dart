import 'package:quick_pay/Models/api_models/student.dart';

class BaseApiResponse {
  int? resultCode;
  int? otp;
  List<Student>? data;
  String? message;

  BaseApiResponse({this.resultCode, this.otp, this.data, this.message});

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    otp = json['otp'];
    if (json['data'] != null) {
      data = <Student>[];
      json['data'].forEach((v) {
        data!.add(new Student.fromJson(v));
      });
    }
    message = json['message'];
  }
}