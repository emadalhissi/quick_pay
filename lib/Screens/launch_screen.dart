import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Login/UI/login_ui.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/Components/launch_edu_fee_pay_text_logo.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SharedPreferencesController().loggedIn
              ? AppNavigation()
              : LoginUI(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/launch_photo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: LaunchEduFeePayTextLogo(),
        ),
      ),
    );
  }
}
