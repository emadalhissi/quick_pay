import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:quick_pay/Locale/locales.dart';

class LaunchEduFeePayTextLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Edu',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontSize: 32),
          ),
          TextSpan(
            text: 'Fee',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontSize: 32),
          ),
          TextSpan(
            text: locale.pay,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).primaryColorLight, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
