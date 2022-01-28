import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/download_receipt.dart';
import 'package:quick_pay/Models/api_models/fee_full_json.dart';
import 'package:quick_pay/Models/api_models/fee_list.dart';
import 'package:quick_pay/Models/api_models/fee_pay_history.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class DownloadReceiptController with ApiHelper {
  Future<DownloadReceipt?> getReceipt(
      BuildContext context, {
        required String orderId,
        required String sid,
      }) async {
    var url = Uri.parse(ApiSettings.downloadReceipt);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'studentId': orderId,
          'sid': sid,
        },
      ),
      headers: headers,
    );
    print('${response.statusCode.toString()} !!');
    var data = jsonDecode(response.body)['data'];
    print('Body: ${response.body}');
    print('Data: $data');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var downloadReceipt = DownloadReceipt.fromJson(jsonDecode(response.body));
      return downloadReceipt;
    } else if (resultCode == 500) {
      var message = jsonDecode(response.body)['message'];
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
