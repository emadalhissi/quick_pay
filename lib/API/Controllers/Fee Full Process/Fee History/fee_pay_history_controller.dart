import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/fee_full_json.dart';
import 'package:quick_pay/Models/api_models/fee_list.dart';
import 'package:quick_pay/Models/api_models/fee_pay_history.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class FeePayHistoryController with ApiHelper {
  Future<FeePayHistory?> getFeePayHistory(
      BuildContext context, {
        required String id,
      }) async {
    print('---getFeePayHistory start---');
    var url = Uri.parse(ApiSettings.feepayHistory1);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'studentId': id,
        },
      ),
      headers: headers,
    );
    print('${response.statusCode}');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      print('---getFeePayHistory inside 200---');
      var feePayHistory = FeePayHistory.fromJson(jsonDecode(response.body));
      return feePayHistory;
    } else if (resultCode == 500) {
      var message = jsonDecode(response.body)['message'];
      // showSnackBar(
      //   context,
      //   message: message,
      //   error: true,
      // );
    } else {
      showSnackBar(
        context,
        message: 'Something went wrong, try again!',
        error: true,
      );
    }
    return null;
  }
}
