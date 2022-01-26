import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/fee_list.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class GetFeeList with ApiHelper {
  Future<List<FeeList>> getFeeList(
      BuildContext context, {
        required String id,
      }) async {
    var url = Uri.parse(ApiSettings.getFeeList);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'studentId': id,
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
      jsonResponse.map((obj) => FeeList.fromJson(obj)).toList();
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
