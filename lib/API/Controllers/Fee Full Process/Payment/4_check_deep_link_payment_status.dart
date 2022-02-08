import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/api_base_response.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Models/api_models/deep_link_payment_status_data.dart';

class CheckDeepLinkPaymentStatus with ApiHelper {
  Future<List<DeepLinkPaymentStatusData?>> checkDeepLinkPaymentStatus(
    BuildContext context, {
    required String schoolCode,
    required String orderId,
  }) async {
    print('CheckDeepLinkPaymentStatus Controller is here!');
    var url = Uri.parse(ApiSettings.checkDeepLinkPaymentStatus);
    var response = await http.post(
      url,
      body: jsonEncode({
        'school_code': schoolCode,
        'order_id': orderId,
      }),
      headers: headers,
    );
    print('${response.statusCode.toString()} !!');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'] as List;
      var jsonResponseData =
      jsonResponse.map((obj) => DeepLinkPaymentStatusData.fromJson(obj)).toList();
      return jsonResponseData;
    }  else if (resultCode == 500) {
      // var message = jsonDecode(response.body)['message'];
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
