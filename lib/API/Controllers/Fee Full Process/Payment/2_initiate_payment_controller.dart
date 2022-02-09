import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/initiate_payment.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Models/api_models/sub_fee_list.dart';

class InitiatePaymentController with ApiHelper {
  Future<InitiatePayment?> initiatePayment(
    BuildContext context, {
    required String amount,
    String paymentType = 'ccavenue',
    required String schoolCode,
    required String studentId,
    required String orderId,

    required List<SubFeeList> subFeeList,

    // required int subFeeAmount,
    // required int subFeeId,
  }) async {
    var url = Uri.parse(ApiSettings.initiatePayment);
    var response = await http.post(
      url,
      body: jsonEncode({
        'amount': '2.0',
        'payment_type': paymentType,
        'school_code': schoolCode,
        'student_id': studentId,
        'order_id': orderId,
        'sub_fee_list': subFeeList,
        // 'sub_fee_list': [
        //   {
        //     'amount': subFeeAmount,
        //     'sub_fee_id': subFeeId,
        //   }
        // ],
      }),
      headers: headers,
    );
    print('2-InitiatePaymentController passed!'.toUpperCase());
    print('${response.statusCode}');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = InitiatePayment.fromJson(jsonDecode(response.body));
      return jsonResponse;
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
    return null;
  }
}
