import 'package:flutter/material.dart';
import 'package:quick_pay/Screens/home_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/mostaql-logo.png'),
              scale: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
