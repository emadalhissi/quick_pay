import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/district.dart';
import 'package:quick_pay/Models/api_models/school.dart';
import 'package:quick_pay/Models/api_models/state.dart';

class GetSchoolController with ApiHelper {
  Future<List<School>> getSchoolList(
    BuildContext context, {
    required int districtId,
  }) async {
    var url = Uri.parse(ApiSettings.schoolList);
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          'district_id': districtId,
        }
      ),
      headers: headers,
    );
    print('${response.statusCode}'); // 200
    var resultCode = jsonDecode(response.body)['resultCode'];
    print('$resultCode');
    if (resultCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'] as List;
      var jsonResponseData =
          jsonResponse.map((obj) => School.fromJson(obj)).toList();
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
