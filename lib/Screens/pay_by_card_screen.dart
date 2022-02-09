import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class PayByCardScreen extends StatefulWidget {
  const PayByCardScreen({Key? key}) : super(key: key);

  @override
  _PayByCardScreenState createState() => _PayByCardScreenState();
}

class _PayByCardScreenState extends State<PayByCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FadedSlideAnimation(
        Center(
          child: Text(
            'Update Soon',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
