import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/API/api_settings.dart';
import 'package:quick_pay/Models/api_models/api_base_response.dart';
import 'package:http/http.dart' as http;

class RegisterController with ApiHelper {
  Future<BaseApiResponse?> register(
    BuildContext context, {
    required String institutionName,
    required String address,
    required String state,
    required String district,
    required String city,
    required int pinCode,
    required String contactPerson,
    required String designation,
    required String whatsAppNumber,
    required int contactNumber,
    required String description,
  }) async {
    var url = Uri.parse(ApiSettings.feepayRegistration);
    var response = await http.post(
      url,
      body: jsonEncode({
        'institution_name': institutionName,
        'address': address,
        'state': state,
        'district': district,
        'city': city,
        'pincode': pinCode,
        'contact_person': contactPerson,
        'designation': designation,
        'whatsapp_number': whatsAppNumber,
        'contact_number': contactNumber,
        'description': description,
      }),
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
