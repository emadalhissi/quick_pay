import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/custom_offers_container.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';

class AddMoneyUI extends StatefulWidget {
  @override
  _AddMoneyUIState createState() => _AddMoneyUIState();
}

class _AddMoneyUIState extends State<AddMoneyUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          locale.addMoney!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 14),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: locale.enterAmount,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: hintColor, fontSize: 22),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.enterPromoCodePage);
                                },
                                child: Text(
                                  locale.havePromo!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .primaryColorLight),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(locale.addMoney),
                    ),
                    Text(
                      'QuickPay ' + locale.balance! + ' \$3.85',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset('assets/imgs/Layer 1194.png'),
                  ),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 12,
                      top: 35,
                      child: Text(
                        locale.dealsOfTheDay!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16),
                      )),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 65),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 125,
                            margin: EdgeInsets.only(left: 8, top: 8),
                            child: CustomOffersContainer());
                      })
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
