import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Models/api_models/deep_link_payment_status_data.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Screens/education_fees_screen.dart';
import 'package:quick_pay/Screens/receipt_screen.dart';
import 'package:quick_pay/Theme/style.dart';

class ReceiptStatusScreen extends StatefulWidget {
  final List<DeepLinkPaymentStatusData?> deepLinkPaymentStatusData;
  final Student student;

  const ReceiptStatusScreen({
    Key? key,
    required this.deepLinkPaymentStatusData,
    required this.student,
  }) : super(key: key);

  @override
  _ReceiptStatusScreenState createState() => _ReceiptStatusScreenState();
}

class _ReceiptStatusScreenState extends State<ReceiptStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EducationFeesScreen(student: widget.student, selectedTab: 1),
        ),
      ),
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 36),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(width: 1, color: Colors.black,),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
                top: 25,
              ),
              child: widget.deepLinkPaymentStatusData.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.grey,
                          size: 80,
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Transaction cancelled by you, please try again!',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Receipt',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Transaction Status:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.deepLinkPaymentStatusData[0]!.status!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Paid Amount:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.deepLinkPaymentStatusData[0]!.paidamount!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Transaction Date:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.deepLinkPaymentStatusData[0]!.transactionAt!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Transaction ID:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.deepLinkPaymentStatusData[0]!.transactionId!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Order No.:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.deepLinkPaymentStatusData[0]!.orderId!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        widget.student.school_name == null
                            ? SizedBox.shrink()
                            : Text(
                                'School Name:',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.grey.shade600),
                              ),
                        widget.student.school_name == null
                            ? SizedBox.shrink()
                            : SizedBox(height: 3),
                        widget.student.school_name == null
                            ? SizedBox.shrink()
                            : Text(
                                widget.student.school_name == null
                                    ? ''
                                    : widget.student.school_name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                        SizedBox(height: 10),
                        Text(
                          'Student ID:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.student.studentId,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Student Name:',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.student.stdname,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Spacer(),
                        checkStatus(widget
                                    .deepLinkPaymentStatusData[0]!.status!) ==
                                true
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReceiptScreen(
                                        orderId: widget
                                            .deepLinkPaymentStatusData[0]!
                                            .orderId!,
                                        sid: '${widget.student.sid}',
                                        transactionId: widget
                                            .deepLinkPaymentStatusData[0]!
                                            .transactionId!,
                                      ),
                                    ),
                                  );
                                },
                                child: CustomButton('Show Receipt'))
                            : SizedBox.shrink(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  bool checkStatus(String status) {
    if (status == 'success' ||
        status == 'success'.toUpperCase() ||
        status == 'Success') {
      return true;
    }
    return false;
  }
}
