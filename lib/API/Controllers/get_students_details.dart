import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Models/db_models/student.dart';
import 'package:quick_pay/Providers/students_provider.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class GetStudentDetailS extends StatefulWidget {
  const GetStudentDetailS({Key? key}) : super(key: key);

  @override
  _GetStudentDetailSState createState() => _GetStudentDetailSState();
}

class _GetStudentDetailSState extends State<GetStudentDetailS> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GetStudentDetails with ApiHelper {
  // Future<List<Student>> getStudents(
  Future<bool> getStudents(
    BuildContext context, {
    required String mobile,
  }) async {
    var url = Uri.parse(ApiSettings.getStdDetails);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'school_id': '1',
          'mobile_number': mobile,
        },
      ),
      headers: headers,
    );
    var resultCode = jsonDecode(response.body)['resultCode'];
    if (resultCode == 200) {
      print('true - $resultCode');
      var jsonResponse = jsonDecode(response.body)['data'] as List;
      List responseDataList =
          jsonResponse.map((obj) => Student.fromJson(obj)).toList();
      // print('DONE DB SAVE');
      var message = jsonDecode(response.body)['message'];
      var otpCode = jsonDecode(response.body)['otp'];
      showSnackBar(
        context,
        message: message,
      );
      SharedPreferencesController().setOtpCode(otpCode: otpCode);
      print('OTP: $otpCode');
      // studentId
      // stdname
      // school_code
      // school_name
      // school_logo

      return true;
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
    return false;
  }

  Future<void> create(BuildContext context) async {
    bool created = await Provider.of<StudentsProvider>(context, listen: false)
        .create(student);
    // if (created) clear();
    // String message = created ? 'Created Successfully' : 'Create failed';
    // showSnackBar(context: context, message: message, error: !created);
    // Future.delayed(const Duration(seconds: 1), () {
    //   Navigator.pop(context);
    // });
  }

  DBStudent get student {
    DBStudent std = DBStudent();
    std.studentId = '';
    std.stdname = '';
    std.school_code = '';
    std.school_name = '';
    std.school_logo = '';
    return std;
  }
}
