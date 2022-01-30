import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Models/api_models/student_details.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class GetStudentDetails with ApiHelper {
  Future<List<Student>> getStudents(
      BuildContext context, {
        required String schoolId,
        required String mobile,
      }) async {
    var url = Uri.parse(ApiSettings.getStdDetails);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'school_id': schoolId,
          'mobile_number': mobile,
        },
      ),
      headers: headers,
    );
    print('${response.statusCode}'); // 200
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'] as List;
      var jsonResponseData =
      jsonResponse.map((obj) => Student.fromJson(obj)).toList();
      var message = jsonDecode(response.body)['message'];
      var otpCode = jsonDecode(response.body)['otp'];
      showSnackBar(
        context,
        message: message,
      );
      SharedPreferencesController().setOtpCode(otpCode: otpCode);
      print('$otpCode');
      return jsonResponseData;
    } else if (resultCode == 500) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
        error: true,
      );
    } else {
      showSnackBar(
        context,
        message: 'Something went wrong, try again!',
        error: true,
      );
    }
    return [];
  }
}
