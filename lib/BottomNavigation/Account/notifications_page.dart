import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class Notification {
  String? title;
  bool read;
  String? time;

  Notification(this.title, this.read, this.time);
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    // List<Notification> _notifications = [
    //   Notification(locale.not1, false, locale.daysAgo),
    //   Notification(locale.not2, false, locale.daysAgo),
    //   Notification(locale.not3, true, locale.daysAgo),
    //   Notification(locale.not3, true, locale.daysAgo),
    //   Notification(locale.not1, true, locale.daysAgo),
    //   Notification(locale.not2, true, locale.daysAgo),
    //   Notification(locale.not3, true, locale.daysAgo),
    //   Notification(locale.not3, true, locale.daysAgo),
    // ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          locale.notifications!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        // ListView.builder(
        //     physics: BouncingScrollPhysics(),
        //     itemCount: _notifications.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        //         child: Material(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(8)),
        //           color: Colors.white,
        //           elevation: 0.5,
        //           child: ListTile(
        //             contentPadding:
        //                 EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        //             title: Text(
        //               _notifications[index].title!,
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .subtitle1!
        //                   .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        //             ),
        //             trailing: _notifications[index].read
        //                 ? SizedBox.shrink()
        //                 : CircleAvatar(
        //                     radius: 5,
        //                     backgroundColor: newNotificationColor,
        //                   ),
        //             subtitle: Text(
        //               '\n' + _notifications[index].time!,
        //               style: TextStyle(height: 0.8),
        //             ),
        //           ),
        //         ),
        //       );
        //     }),
        Center(
          child: Text(
            'Thanks for choosing Edu Fee Pay',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
