import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_district_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_school_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_state_controller.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/DB/controllers/students_db_controller.dart';
import 'package:quick_pay/Models/api_models/district.dart';
import 'package:quick_pay/Models/api_models/school.dart';
import 'package:quick_pay/Models/api_models/state.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class EnterOtpScreen extends StatefulWidget {

  final List<Student> studentList;
  const EnterOtpScreen({
    Key? key,
    required this.studentList,
  }) : super(key: key);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> with ApiHelper {
  late TextEditingController otpEditingController;
  final StudentDbController _DBProviderController = StudentDbController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    otpEditingController = TextEditingController();
  }

  @override
  void dispose() {
    otpEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 2,
        title: Text(
          'VERIFICATION',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'Enter OTP code, we just sent you',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: otpEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 12),
                    hintText: 'OTP Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 50),
              loading == true
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: InkWell(
              onTap: () async {
                await performContinue();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  'CONTINUE',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performContinue() async {
    if (checkOtp()) {
      await continueTo();
    }
  }

  bool checkOtp() {
    if (otpEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter OTP!',
        error: true,
      );
      return false;
    } else if (otpEditingController.text.length != 4) {
      showSnackBar(
        context,
        message: 'OTP must be 4 digits!',
        error: true,
      );
      return false;
    }
    return true;
  }

  Future<void> continueTo() async {
    setState(() {
      loading = true;
    });

    if (otpEditingController.text.toString() ==
        SharedPreferencesController().getOtpCode.toString()) {
      print('Verification done++');
      for (int i = 0; i < widget.studentList.length; i++) {
        await _DBProviderController.create(widget.studentList[i]);
      }
      print('SAVE DATABASE++');
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AppNavigation()));
    }
  }
}
