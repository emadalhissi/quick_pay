import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.vertical -
                AppBar().preferredSize.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: EntryField(
                          locale.enterPhoneNumber,
                          Icon(
                            Icons.perm_contact_calendar_rounded,
                            color: Theme.of(context).primaryColorLight,
                          )),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: Image.asset(
                        'assets/imgs/Layer 1347.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () => Navigator.pushNamed(
                    //         context, PageRoutes.paymentSuccessfulPage),
                    //     child: Image.asset(
                    //       'assets/imgs/Layer 1347.png',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 112),
                    Text(
                      locale.scanQrCode!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/qr code scanner.png',
                          scale: 3.5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.flash_off,
                              color: scaffoldBackgroundColor,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.photo,
                              color: scaffoldBackgroundColor,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
      //       child: EntryField(
      //           'Enter Phone Number',
      //           Icon(
      //             Icons.perm_contact_calendar_rounded,
      //             color: Theme.of(context).primaryColorLight,
      //           )),
      //     ),
      //     SizedBox(height: 24),
      //     GestureDetector(
      //       onTap: () =>
      //           Navigator.pushNamed(context, PageRoutes.paymentSuccessfulPage),
      //       child: Stack(
      //         alignment: Alignment.center,
      //         children: [
      //           Image.asset(
      //             'assets/imgs/Layer 1347.png',
      //             width: MediaQuery.of(context).size.width,
      //             fit: BoxFit.fill,
      //           ),
      //           Stack(
      //             alignment: Alignment.center,
      //             children: [

      //             ],
      //           ),
      //           Positioned.directional(
      //               top: 40,
      //               textDirection: Directionality.of(context),
      //               child:

      //           Positioned.directional(
      //               textDirection: Directionality.of(context),
      //               bottom: MediaQuery.of(context).size.height / 4,
      //               child:

      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
