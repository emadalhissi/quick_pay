import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_district_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_school_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_state_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_students_details.dart';
import 'package:quick_pay/API/Controllers/get_students_details_by_mobile.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Models/api_models/district.dart';
import 'package:quick_pay/Models/api_models/school.dart';
import 'package:quick_pay/Models/api_models/state.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Models/api_models/student_details.dart';
import 'package:quick_pay/Screens/Add%20Student/enter_otp.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class EnterMobileScreen extends StatefulWidget {
  final int stateId;
  final int districtIId;
  final String schoolId;

  const EnterMobileScreen({
    Key? key,
    required this.stateId,
    required this.districtIId,
    required this.schoolId,
  }) : super(key: key);

  @override
  _EnterMobileScreenState createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> with ApiHelper {
  late TextEditingController mobileEditingController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    mobileEditingController = TextEditingController();
  }

  @override
  void dispose() {
    mobileEditingController.dispose();
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
          'MOBILE',
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
                  'Enter Registered Mobile Number',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: mobileEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 14, end: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('+91 '),
                        ],
                      ),
                    ),
                    prefixStyle:
                        Theme.of(context).textTheme.subtitle1!.copyWith(),
                    contentPadding: EdgeInsetsDirectional.only(start: 12),
                    hintText: 'Registered Mobile Number',
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
                await performSendOtp();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  'SEND OTP',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performSendOtp() async {
    if (checkMobileData()) {
      await sendOtp();
    }
  }

  bool checkMobileData() {
    if (mobileEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter Number!',
        error: true,
        fromBottom: true,
        margin: 100,
      );
      return false;
    } else if (mobileEditingController.text.length != 10) {
      showSnackBar(
        context,
        message: 'Number must be 10 digits!',
        error: true,
        fromBottom: true,
        margin: 100,
      );
      return false;
    }
    return true;
  }

  Future<void> sendOtp() async {
    setState(() {
      loading = true;
    });
    List<Student> studentList = await GetStudentDetails().getStudents(
      context,
      schoolId: widget.schoolId,
      mobile: mobileEditingController.text,
    );
    if (studentList.isNotEmpty) {
      // for (int i = 0; i < status.length; i++) {
      //   await _DBProviderController.create(status[i]);
      // }
      // print('SAVE DATABASE++');
      setState(() {
        loading = false;
      });
      print('Otp sent++');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EnterOtpScreen(studentList: studentList,)));
    }
  }
}
