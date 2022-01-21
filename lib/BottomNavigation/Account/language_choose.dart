import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/language_cubit.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  late LanguageCubit _languageCubit;
  int? selectedLanguage = -1;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List languages = [
      "English",
      "عربى",
      "Français",
      "português",
      "bahasa Indonesia",
      "español",
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          locale.languages!,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                locale.language!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          FadedSlideAnimation(
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    locale.selectPreferredLanguage!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 50),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: languages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                      child: RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        activeColor: Theme.of(context).primaryColor,
                        title: Text(languages[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                        value: index,
                        groupValue: selectedLanguage,
                        onChanged: (dynamic val) {
                          setState(() {
                            selectedLanguage = val;
                            print(val);
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                if (selectedLanguage == 0) {
                  _languageCubit.selectEngLanguage();
                } else if (selectedLanguage == 1) {
                  _languageCubit.selectArabicLanguage();
                } else if (selectedLanguage == 2) {
                  _languageCubit.selectFrenchLanguage();
                } else if (selectedLanguage == 3) {
                  _languageCubit.selectPortugueseLanguage();
                } else if (selectedLanguage == 4) {
                  _languageCubit.selectIndonesianLanguage();
                } else if (selectedLanguage == 5) {
                  _languageCubit.selectSpanishLanguage();
                }
                Navigator.pop(context);
              },
              child: FadedScaleAnimation(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 55,
                      child: FadedScaleAnimation(
                        CustomButton(locale.submit),
                        durationInMilliseconds: 600,
                      )),
                ),
                durationInMilliseconds: 600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
