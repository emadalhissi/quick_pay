import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/get_students_details.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/assets.dart';

import '../../../Theme/colors.dart' show transparentColor;
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

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
                    onTap: () async  {
                      await performLogin();
                    },
                    child: CustomButton(
                      locale.signIn!.toUpperCase(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
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
      print('check');
    }
  }

  bool checkData() {
    if (_mobileEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    print('check from login');
    bool status = await GetStudentDetails()
        .getStudents(context, mobile: _mobileEditingController.text);
    if(status) {
      // SharedPreferencesController().login();
      // TODO: Navigate to verification
    }
  }
}
