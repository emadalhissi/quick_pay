import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';

class AuthApiController with ApiHelper {
  Future<bool> login(
    BuildContext context, {
    required String mobile,
  }) async {
    var url = Uri.parse(ApiSettings.getStdDetailsByMobile);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'mobile_number': mobile,
        },
      ),
      headers: headers,
    );
    var resultCode = jsonDecode(response.body)['resultCode'];
    if(response.statusCode == 200) {
      var loginResponse = jsonDecode(response.body);
    }
    return false;
  }
}
