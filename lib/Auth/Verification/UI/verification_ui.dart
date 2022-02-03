import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Auth/Verification/UI/verification_interactor.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  @override
  _VerificationUIState createState() => _VerificationUIState();

  VerificationUI(this.verificationInteractor,{
    Key? key,

  }) : super(key: key);
}

class _VerificationUIState extends State<VerificationUI> with ApiHelper {
  late TextEditingController _codeEditingController;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _codeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical -
                  AppBar().preferredSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.phoneVerification!,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    locale.enter6digitcode! + '\n' + locale.sentOnGivenNum!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 0,
                    child: Stack(
                      children: [
                        EntryField(
                          locale.enterCodeHere,
                          null,
                          controller: _codeEditingController,
                          formatter: '0-9',
                          inputType: TextInputType.number,
                        ),
                        loading
                            ? Center(child: CircularProgressIndicator())
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: CustomButton(
                      locale.submit!.toUpperCase(),
                      onTap: () async {
                        await performVerify();
                        widget.verificationInteractor.verificationDone();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      locale.codeResend!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Future<void> performVerify() async {
    if (checkData()) {
      await verify();
    }
  }

  bool checkData() {
    if (_codeEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter Code!',
        error: true,
        fromBottom: true,
        margin: 100,
      );
      return false;
    } else if (_codeEditingController.text.length != 4) {
      showSnackBar(
        context,
        message: 'Number must be 4 digits!',
        error: true,
        fromBottom: true,
        margin: 100,
      );
      return false;
    }
    return true;
  }

  Future<void> verify() async {
    setState(() {
      loading = true;
    });
    var code = SharedPreferencesController().getOtpCode.toString();
    bool status = code == _codeEditingController.text ? true : false;
    if (status) {
      SharedPreferencesController().login();
      // showSnackBar(context, message: 'Thank you for coming back!');
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AppNavigation(),
        ),
      );
    } else {
      setState(() {
        loading = false;
      });
      showSnackBar(
        context,
        message: 'Wrong code!',
        error: true,
        fromBottom: true,
        margin: 100,
      );
    }
  }
}
