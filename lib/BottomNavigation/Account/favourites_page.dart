import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/mall_products_grid_view.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.favorites!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: MallProductGridView(
              isFavourite: true,
            )),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
