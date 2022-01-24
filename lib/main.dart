import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/DB/db_provider.dart';
import 'package:quick_pay/language_cubit.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await SharedPreferencesController().initSharedPreferences();
  await DBProvider().initDatabase();
  final prefs = await SharedPreferences.getInstance();
  String? locale = prefs.getString('locale');
  runApp(
    BlocProvider(
      create: (context) => LanguageCubit(locale),
      child: QuickPay(),
    ),
  );
}

class QuickPay extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, appLocale) {
        return MaterialApp(
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          ///supported Languages
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
            const Locale('fr'),
            const Locale('id'),
            const Locale('pt'),
            const Locale('es'),
          ],
          locale: appLocale,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          // home: SharedPreferencesController().loggedIn ? AppNavigation() : LoginNavigator(),
          home: LoginNavigator(),
          routes: PageRoutes().routes(),
        );
      },
    );
  }
}
