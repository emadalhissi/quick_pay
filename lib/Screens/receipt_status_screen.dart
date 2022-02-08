import 'package:flutter/material.dart';
import 'package:quick_pay/Theme/style.dart';

class ReceiptStatusScreen extends StatefulWidget {
  const ReceiptStatusScreen({Key? key}) : super(key: key);

  @override
  _ReceiptStatusScreenState createState() => _ReceiptStatusScreenState();
}

class _ReceiptStatusScreenState extends State<ReceiptStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            gradient: linearGrad,
          ),
          // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                title: Text(
                  'Receipt',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 20,
                      ),
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 70.0),
      ),
    );
  }
}
