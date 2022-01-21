import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/Components/entry_field.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          locale.myProfile!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                locale.update!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Material(
              elevation: 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Spacer(),
                    Hero(
                      tag: 'dp',
                      child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/imgs/Layer 1032.png')),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(locale.changePicture!),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 0.5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: EntryField(
                              locale.firstName,
                              null,
                              labelText: locale.firstName,
                              initialValue: 'Sam',
                            )),
                        Spacer(),
                        Expanded(
                            flex: 4,
                            child: EntryField(
                              locale.lastName,
                              null,
                              labelText: locale.lastName,
                              initialValue: 'Smith',
                            )),
                      ],
                    ),
                    EntryField(
                      locale.emailAddress,
                      Image.asset(
                        'assets/icons/ic_verified.png',
                        scale: 2,
                      ),
                      labelText: locale.emailAddress,
                      initialValue: 'samsmith@mail.com',
                    ),
                    EntryField(
                      locale.phoneNumber,
                      Image.asset(
                        'assets/icons/ic_verified.png',
                        scale: 2,
                      ),
                      labelText: locale.phoneNumber,
                      initialValue: '+1 987 654 3210',
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: EntryField(
                              locale.gender,
                              null,
                              labelText: locale.gender,
                              initialValue: locale.male,
                            )),
                        Spacer(),
                        Expanded(
                            flex: 4,
                            child: EntryField(
                              locale.dateOfBirth,
                              null,
                              labelText: locale.dateOfBirth,
                              initialValue: '23rd Dec, 1990',
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
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
}
