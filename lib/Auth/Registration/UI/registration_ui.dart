import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Registration/UI/register_interactor.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:quick_pay/Theme/colors.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Widget> carouselWidgets = [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),
    ];
    var theme = Theme.of(context);
    return Scaffold(
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
                          locale.signUp!.toUpperCase(),
                          style: theme.textTheme.headline6!
                              .copyWith(color: theme.scaffoldBackgroundColor),
                        )),
                    CarouselSlider(
                      items: carouselWidgets,
                      options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: 0,
                        top: 30,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: scaffoldBackgroundColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      bottom: 10,
                      child: Row(
                        children: carouselWidgets.map((i) {
                          int index = carouselWidgets.indexOf(i);
                          return Container(
                            width: 12.0,
                            height: 3.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _current == index
                                  ? Colors.white /*.withOpacity(0.9)*/
                                  : Colors.white.withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: locale.fullName,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      Assets.accountIcon,
                      scale: 2.5,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: locale.emailAddress,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      Assets.emailIcon,
                      scale: 2.5,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: locale.phoneNumber,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      Assets.phoneIcon,
                      scale: 2.5,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: locale.createPassword,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      Assets.passwordIcon,
                      scale: 2.5,
                    ),
                  ),
                ),
                Material(
                  elevation: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: scaffoldBackgroundColor,
                      hintText: locale.confirmPassword,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Image.asset(
                        Assets.passwordIcon,
                        scale: 2.5,
                      ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  locale.signUp!.toUpperCase(),
                  onTap: () {
                    widget.registrationInteractor
                        .register('phoneNumber', 'name', 'email');
                  },
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
