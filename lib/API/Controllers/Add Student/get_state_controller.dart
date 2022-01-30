import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/state.dart';

class GetStateController with ApiHelper {
  Future<List<StateModel>> getStateList(BuildContext context) async {
    var url = Uri.parse(ApiSettings.stateList);
    var response = await http.post(
      url,
      headers: headers,
    );
    print('${response.statusCode}'); // 200
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'] as List;
      var jsonResponseData =
      jsonResponse.map((obj) => StateModel.fromJson(obj)).toList();
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
