import 'package:flutter/material.dart';
import 'package:quick_pay/BottomNavigation/Account/account_page.dart';
import 'package:quick_pay/BottomNavigation/Mall/mall_page.dart';
import 'package:quick_pay/BottomNavigation/Orders/my_orders.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'Home/home.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    MallPage(),
    Container(),
    MyOrdersPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              'assets/icons/footer menu/ic_home.png',
            ),
          ),
          label: locale.home),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              'assets/icons/footer menu/ic_mall.png',
            ),
          ),
          label: locale.mall),
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/footer menu/ic_scane.png',
            scale: 2.5,
          ),
          label: locale.scan),
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/footer menu/ic_orders.png',
            scale: 2.5,
          ),
          label: locale.orders),
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/footer menu/ic_account.png',
            scale: 2.5,
          ),
          label: locale.account),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: blackColor,
        // selectedIconTheme: IconThemeData(color: blackColor),
        // unselectedIconTheme: IconThemeData(color: blackColor),
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, PageRoutes.scanPage);
          }
          setState(() {
            _currentIndex = index != 2 ? index : _currentIndex;
          });
        },
      ),
    );
  }
}
