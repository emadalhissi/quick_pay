import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class NeedHelpPage extends StatefulWidget {
  @override
  _NeedHelpPageState createState() => _NeedHelpPageState();
}

class _NeedHelpPageState extends State<NeedHelpPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String?> _faqs = [
      locale.faq1,
      locale.faq2,
      locale.faq3,
      locale.faq4,
      locale.faq5,
      locale.faq6,
      locale.faq7,
      locale.faq8,
      locale.faq1,
      locale.faq2,
      locale.faq3,
      locale.faq4,
      locale.faq5,
      locale.faq6,
      locale.faq7,
      locale.faq8,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.help!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: _faqs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
                child: Text(
                  _faqs[index]!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 17),
                ),
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
