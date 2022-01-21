import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/book_ticket.dart';
import 'package:quick_pay/Components/custom_offers_container.dart';
import 'package:quick_pay/Components/custom_options_grid_view.dart';
import 'package:quick_pay/Components/quick_pay_text.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Payment {
  String image;
  String? title;
  Function onTap;
  Payment(this.image, this.title, this.onTap);
}

class _HomePageState extends State<HomePage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Payment> _paymentOptions = [
      Payment('assets/icons/ic_pay.png', locale.payOrSend, () {
        Navigator.pushNamed(context, PageRoutes.scanPage);
      }),
      Payment('assets/icons/ic_add money.png', locale.addMoney, () {
        Navigator.pushNamed(context, PageRoutes.addMoneyPage);
      }),
      Payment('assets/icons/ic_get payment.png', locale.getPayment, () {
        Navigator.pushNamed(context, PageRoutes.getPaymentPage);
      }),
      Payment('assets/icons/ic_transactions.png', locale.transactions, () {
        Navigator.pushNamed(context, PageRoutes.transactionPage);
      }),
    ];
    List<Payment> _quickPays = [
      Payment('assets/icons/ic_recharge.png', locale.recharge, () {
        Navigator.pushNamed(context, PageRoutes.phoneRechargePage);
      }),
      Payment('assets/icons/ic_electricity.png', locale.electricity, () {}),
      Payment('assets/icons/ic_train.png', locale.trainTicket, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 0,
                    )));
      }),
      Payment('assets/icons/ic_flight.png', locale.flight, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 1,
                    )));
      }),
      Payment('assets/icons/ic_bus.png', locale.bus, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 2,
                    )));
      }),
      Payment('assets/icons/ic_dth.png', locale.dth, () {}),
      Payment('assets/icons/ic_broadband.png', locale.broadband, () {}),
      Payment('assets/icons/ic_more.png', locale.more, () {}),
    ];
    return Builder(
      builder: (BuildContext context) {
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          gradient: linearGrad,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(8))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 54, bottom: 8),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.searchPage);
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 10),
                                  child: QuickPayText(),
                                ),
                                suffixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none)),
                          ),
                          CustomGridView(_paymentOptions),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/imgs/Layer 1150.png',
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 18, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.quickRechargesBillPays!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomGridView(_quickPays)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                if (_anchoredBanner != null)
                  Container(
                    width: _anchoredBanner!.size.width.toDouble(),
                    height: _anchoredBanner!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredBanner!),
                  ),
                SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/imgs/Layer 1194.png',
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 18, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.saveOnBillPayments!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 135,
                            child: ListView.builder(
                                // padding: EdgeInsets.symmetric(horizontal: 8),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return CustomOffersContainer();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                WinterSaleBanner(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
