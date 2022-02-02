import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/api_base_response.dart';
import 'package:http/http.dart' as http;

class AskQuestionController with ApiHelper {
  Future<BaseApiResponse?> askQuestion(
    BuildContext context, {
    required String userName,
    required int mobileNumber,
    required String question,
  }) async {
    var url = Uri.parse(ApiSettings.saveQuestions);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'user_name': userName,
          'mobile': mobileNumber,
          'question': question,
        },
      ),
      headers: headers,
    );
    print('${response.statusCode.toString()} !!');
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var message = jsonDecode(response.body)['message'];
      var jsonResponse = BaseApiResponse.fromJson(jsonDecode(response.body));
      showSnackBar(
        context,
        message: message,
        margin: 150,
      );
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
