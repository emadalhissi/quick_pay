import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/icici_qr_code.dart';
import 'package:quick_pay/Models/icici_qr_code_full_response.dart';

class IcIciQRCodeController with ApiHelper {
  Future<IcIciQRCodeFullResponse?> getIcIciQrCode(
    BuildContext context, {
    required String amount,
    required String orderId,
  }) async {
    print('-----Entered IcIciQRCodeController-----');
    var url = Uri.parse(ApiSettings.iciciQRCode);
    var response = await http.post(
      url,
      body: jsonEncode({
        'amount': amount,
        'order_id': orderId,
      }),
      headers: headers,
    );
    print('${response.statusCode} from IcIciQRCodeController');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = IcIciQRCodeFullResponse.fromJson(jsonDecode(response.body));
      return jsonResponse;
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
