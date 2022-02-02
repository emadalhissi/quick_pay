import 'package:flutter/material.dart';

mixin ApiHelper {
  void showSnackBar(
      BuildContext context, {
        required String message,
        bool error = false,
        bool fromBottom = false,
        double margin = 100,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: fromBottom == true ? margin : MediaQuery.of(context).size.height - margin,
          right: 20,
          left: 20,
        ),
      ),
    );
  }

  Map<String, String> get headers {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    // if(SharedPreferencesController().loggedIn) {
    //   headers['Authorization'] = SharedPreferencesController().getToken;
    // }
    return headers;
  }
}