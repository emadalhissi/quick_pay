import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/edu_fee_pay_text_logo.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class GetPaymentPage extends StatefulWidget {
  @override
  _GetPaymentPageState createState() => _GetPaymentPageState();
}

class _GetPaymentPageState extends State<GetPaymentPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        title: EduFeePayTextLogo(),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 8,
            ),
            Text(
              locale.scanThisCode!,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            FadedScaleAnimation(Image.asset(
              'assets/img_qrcode.png',
              height: 220,
            )),
            Spacer(
              flex: 3,
            ),
            Text('samntha smith'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
            Spacer(),
            Text('+1 987 654 3210',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center),
            Spacer(
              flex: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: CustomButton(
                locale.downloadQrCode,
                textColor: Theme.of(context).primaryColorLight,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
