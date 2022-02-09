import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Login/UI/login_ui.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/DB/controllers/students_db_controller.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/style.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class AccountTile {
  String image;
  String? title;

  AccountTile(this.image, this.title);
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<AccountTile> accountOptions = [
      // AccountTile('assets/icons/account/ic_settings.png', AppLocalizations.of(context)!.favorites, () {
      //   Navigator.pushNamed(context, PageRoutes.favouritesPage);
      // }),
      AccountTile(
        'assets/icons/account/ic_invite.png',
        AppLocalizations.of(context)!.notifications,
      ),
      AccountTile(
        'assets/icons/account/ic_help.png',
        AppLocalizations.of(context)!.needHelp,
      ),
      AccountTile(
        'assets/icons/account/ic_rate.png',
        AppLocalizations.of(context)!.rateUs,
      ),
      AccountTile(
        'assets/icons/account/ic_guideline.png',
        'Contact Us, ${AppLocalizations.of(context)!.tnc}',
      ),
      AccountTile(
        'assets/icons/account/ic_language.png',
        AppLocalizations.of(context)!.language,
      ),
      AccountTile(
        'assets/icons/account/ic_logout.png',
        'Logout',
      ),
    ];
    return WillPopScope(
      onWillPop: () async => await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppNavigation(),)) ?? null,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  title: Text(
                    locale.account!,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 70.0),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // SizedBox(
            //   height: 12,
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.grey[300]!)]),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 5),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.notificationsPage);
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[0].image,
                          scale: accountOptions[0].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[0].title!),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, PageRoutes.helpPage);
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[1].image,
                          scale: accountOptions[1].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[1].title!),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, PageRoutes.helpPage);
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[2].image,
                          scale: accountOptions[2].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[2].title!),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.tncPage);
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[3].image,
                          scale: accountOptions[3].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[3].title!),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.chooseLanguage);
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[4].image,
                          scale: accountOptions[4].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[4].title!),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SharedPreferencesController().clear();
                      StudentDbController().clearDb();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUI(),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      leading: FadedScaleAnimation(
                        Image.asset(
                          accountOptions[5].image,
                          scale: accountOptions[5].title == 'Logout' ? 9 : 2.8,
                        ),
                      ),
                      title: Text(accountOptions[5].title!),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: WinterSaleBanner(),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
