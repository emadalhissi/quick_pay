import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/heading_container_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    double balance = 3.85;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          locale.transactions!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              locale.quickPayBalance!,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),
            Text('\$' + balance.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: blackColor),
                textAlign: TextAlign.center),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: CustomButton(
                  locale.sendToBank,
                  textColor: Theme.of(context).primaryColorLight,
                  color: Theme.of(context).scaffoldBackgroundColor,
                )),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: CustomButton(locale.addMoney)),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomHeading(
                        heading: locale.today! + ',19 Dec, 2018',
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    'assets/icons/ic_pay.png',
                                    scale: 2.5,
                                  ),
                                  title: Text(
                                    locale.payForOrderOnQuickPay!,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    '3:14 pm | ' + locale.prepaidRecharge!,
                                    style: TextStyle(
                                        fontSize: 12, color: hintColor),
                                  ),
                                  trailing: Text('- \$ 10.50'),
                                ),
                                index != 2
                                    ? Divider(thickness: 6)
                                    : SizedBox.shrink(),
                              ],
                            );
                          })
                    ],
                  );
                }),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
