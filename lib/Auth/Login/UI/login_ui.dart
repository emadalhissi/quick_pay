import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_pay/API/Controllers/get_students_details_by_mobile.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Auth/Verification/UI/verifiaction_page.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/edu_fee_pay_text_logo.dart';
import 'package:quick_pay/Components/launch_edu_fee_pay_text_logo.dart';
import 'package:quick_pay/DB/controllers/students_db_controller.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Screens/register_screen.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

import '../../../Theme/colors.dart' show transparentColor;
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> with ApiHelper {
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;
  final StudentDbController _DBProviderController = StudentDbController();

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(0),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(Assets.background),
                    Positioned(
                      top: 40,
                      child: Text(
                        locale.signIn!.toUpperCase(),
                        style: theme.textTheme.headline6!
                            .copyWith(color: theme.scaffoldBackgroundColor),
                      ),
                    ),
                    // Image.asset(Assets.appLogo, scale: 2.5),
                    LaunchEduFeePayTextLogo(),
                    Positioned(
                      bottom: 50,
                      child: loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
                TextField(
                  controller: _mobileEditingController,
                  decoration: InputDecoration(
                    hintText: locale.phoneNumber,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      Assets.phoneIcon,
                      scale: 2.5,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      await performLogin();
                    },
                    child: CustomButton(
                      locale.signIn!.toUpperCase(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Surena Management Solutions Pvt. Ltd.,',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Column(
                children: [
                  Text(
                    locale.notRegisteredYet!,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      locale.registerNow!.toUpperCase(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      textColor: transparentColor,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_mobileEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter Number!',
        error: true,
      );
      return false;
    } else if (_mobileEditingController.text.length != 10) {
      showSnackBar(
        context,
        message: 'Number must be 10 digits!',
        error: true,
      );
      return false;
    }
    return true;
  }

  Future<void> login() async {
    
    print('check from login++');
    setState(() {
      loading = true;
    });
    List<Student> studentList = await GetStudentDetailsByMobile()
        .getStudentsByMobile(context, mobile: _mobileEditingController.text);
    if (studentList.isNotEmpty) {
      print('LOGIN DONE++');
      for (int i = 0; i < studentList.length; i++) {
        await _DBProviderController.create(studentList[i]);
      }
      print('SAVE DATABASE++');
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPage(null),
        ),
      );
    }
  }
}
