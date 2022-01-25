import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_pay/API/Controllers/auth_api_controller.dart';
import 'package:quick_pay/API/Controllers/get_students_details.dart';
import 'package:quick_pay/API/Controllers/get_students_details_by_mobile.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Auth/Verification/UI/verifiaction_page.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/DB/controllers/students_db_controller.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Routes/routes.dart';
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
                    Image.asset(Assets.appLogo, scale: 2.5),
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
                // Material(
                //   color: theme.scaffoldBackgroundColor,
                //   elevation: 2,
                //   child: TextField(
                //     controller: _passwordEditingController,
                //     decoration: InputDecoration(
                //       hintText: locale.password,
                //       border: OutlineInputBorder(borderSide: BorderSide.none),
                //       prefixIcon: Image.asset(
                //         Assets.passwordIcon,
                //         scale: 2.5,
                //       ),
                //       suffixIcon: GestureDetector(
                //         onTap: () {
                //           widget.loginInteractor.forgotPassword();
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 16.0, horizontal: 12),
                //           child: Text(
                //             locale.forgot!,
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .bodyText1!
                //                 .copyWith(
                //                   color: Theme.of(context).primaryColorLight,
                //                 ),
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      await performLogin();
                      print('Clicked');
                    },
                    child: CustomButton(
                      locale.signIn!.toUpperCase(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: InkWell(
                //     onTap: () async {
                //       List<Student> st = [];
                //       st = await _DBProviderController.read();
                //       if (st.isNotEmpty) {
                //         for (int i = 0; i < st.length; i++) {
                //           print("data item " + st[i].email);
                //         }
                //         print('PRINT DATABASE++');
                //       }
                //     },
                //     child: CustomButton(
                //       "Print DataBase",
                //     ),
                //   ),
                // ),
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
                        widget.loginInteractor.signUp();
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
    print('Still Loading');
    setState(() {
      loading = true;
    });
    List<Student> status = await GetStudentDetailsByMobile()
        .getStudents(context, mobile: _mobileEditingController.text);
    if (status.isNotEmpty) {
      print('LOGIN DONE++');
      SharedPreferencesController().login();
      for (int i = 0; i < status.length; i++) {
        await _DBProviderController.create(status[i]);
      }
      print('SAVE DATABASE++');
      print('Finish Loading');
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
