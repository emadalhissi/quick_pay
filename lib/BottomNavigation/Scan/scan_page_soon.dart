import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class ScanQRPageSoon extends StatefulWidget {
  @override
  _ScanQRPageSoonState createState() => _ScanQRPageSoonState();
}

class _ScanQRPageSoonState extends State<ScanQRPageSoon> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Scan',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        Center(
          child: Text(
            'Update Soon',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
