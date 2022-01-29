import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/fee_pay_history_controller.dart';
import 'package:quick_pay/API/Controllers/get_fee_list.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/my_custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Models/api_models/fee_full_json.dart';
import 'package:quick_pay/Models/api_models/fee_list.dart';
import 'package:quick_pay/Models/api_models/fee_pay_history.dart';
import 'package:quick_pay/Models/api_models/student.dart';
import 'package:quick_pay/Screens/receipt_screen.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/Theme/style.dart';
import 'package:quick_pay/shared_preferences/shared_preferences_controller.dart';

class EducationFeesScreen extends StatefulWidget {
  final String id;

  const EducationFeesScreen({Key? key, required this.id}) : super(key: key);

  @override
  _EducationFeesScreenState createState() => _EducationFeesScreenState();
}

class _EducationFeesScreenState extends State<EducationFeesScreen> {
  final _formKey = GlobalKey<FormState>();

  var myMenuItems = <String>[];

  late FeeFullJson? feeFullJson;
  late Future<FeeFullJson?> _feeFullJsonFuture;

  late FeePayHistory? feePayHistory;
  late Future<FeePayHistory?> _feePayHistoryFuture;

  bool _isChecked = false;

  // late TextEditingController feeEditingController;

  num mandatoryFee = 0;

  // num totalFee = 0 + SharedPreferencesController().getTotalFee;
  num totalFee = 0;
  num conveyanceFee = 0;
  List<bool> _isCheckedList = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  // var _isCheckedArray;

  @override
  void initState() {
    super.initState();

    _feeFullJsonFuture = GetFeeList().getFeeList(context, id: widget.id);
    _feePayHistoryFuture =
        FeePayHistoryController().getFeePayHistory(context, id: widget.id);
    // feeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // feeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(
                // locale.myOrders!,
                'Education Fees',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 20),
              ),
              bottom: TabBar(
                indicatorWeight: 4.0,
                // indicator: ShapeDecoration(
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                // ),
                // labelPadding: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: [
                  Tab(
                    text: 'Fee Details',
                  ),
                  Tab(
                    text: 'Transaction Details',
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  itemBuilder: (context) {
                    return myMenuItems.map((String string) {
                      return PopupMenuItem<String>(
                        child: Text(string),
                        value: string,
                      );
                    }).toList();
                  },
                )
                // GestureDetector(
                //   onTap: () {},
                //   child: Image.asset(
                //     'assets/icons/ic_search_wt.png',
                //     width: 20,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Image.asset(
                //       'assets/icons/ic_cart_wt.png',
                //       width: 20,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 110.0),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
              child: FadedSlideAnimation(
                FutureBuilder<FeeFullJson?>(
                  future: _feeFullJsonFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data != null) {
                      feeFullJson = snapshot.data;
                      num fee = 0;
                      for (int i = 0; i < feeFullJson!.data!.length; i++) {
                        if (feeFullJson!.data![i].isMandatory == 1) {
                          print('$i ${feeFullJson!.data![i].fixedFee}');
                          fee += feeFullJson!.data![i].fixedFee!;
                        }
                      }
                      mandatoryFee = fee;
                      print('mandatoryFee: $mandatoryFee');
                      print('totalFee: $totalFee');
                      // SharedPreferencesController()
                      //     .setTotalFee(totalFee: int.parse(fee.toString()));
                      // print('fee of $fee saved to sp');
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ListView(
                              children: [
                                // Container(),
                                Material(
                                  elevation: 0.5,
                                  color: Colors.grey.shade300,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    child: buildItemProperty(
                                      context,
                                      feeFullJson!.notes!,
                                      SizedBox.shrink(),
                                      SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  itemCount: feeFullJson!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Material(
                                        elevation: 0.8,
                                        child: Padding(
                                          padding: EdgeInsets.zero,
                                          child: CheckboxListTile(
                                            activeColor: feeFullJson!
                                                        .data![index]
                                                        .isMandatory ==
                                                    1
                                                ? Color(0xffbdbdbd)
                                                : Color(0xff1976d3),
                                            tristate: true,
                                            value: feeFullJson!.data![index]
                                                        .isMandatory ==
                                                    1
                                                ? true
                                                : _isCheckedList[index],
                                            onChanged: (value) {
                                              setState(() {
                                                // _isCheckedList[index] =
                                                //     !_isCheckedList[index];
                                                if (feeFullJson!.data![index]
                                                        .isMandatory ==
                                                    1) {
                                                  totalFee += 0;
                                                  // feeEditingController.text = totalFee.toString();
                                                } else if (_isCheckedList[
                                                        index] ==
                                                    false) {
                                                  _isCheckedList[index] = true;
                                                  setState(() {
                                                    totalFee += feeFullJson!
                                                        .data![index].fixedFee!;
                                                  });
                                                  // feeEditingController.text =
                                                  //     totalFee.toString();
                                                } else {
                                                  _isCheckedList[index] = false;
                                                  totalFee -= feeFullJson!
                                                      .data![index].fixedFee!;
                                                  // feeEditingController.text =
                                                  //     totalFee.toString();
                                                }
                                              });
                                            },
                                            title: myBuildItemProperty(
                                              context,
                                              feeFullJson!.data![index].subFee!,
                                              // 'fed',
                                              Text(
                                                feeFullJson!
                                                    .data![index].fixedFee
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              // SizedBox(
                                              //   width: 20,
                                              //   height: 20,
                                              //   child: Checkbox(
                                              //     value: false,
                                              //     onChanged: (v){},
                                              //     // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Column(
                              children: [
                                // Expanded(child: Center()),
                                Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  // height: 50,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                            .only(
                                                        start: 15, top: 5),
                                                child: Text(
                                                  '₹',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(width: 17),
                                              Text(
                                                (totalFee + mandatoryFee)
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Conveyance Fee: ' +
                                            calcConveyanceFee(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(height: 7),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: MyCustomButton(
                                          'PAY NOW',
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  insetPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  content: Container(
                                                    // height: 200,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Form(
                                                          key: _formKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Align(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                      'Choose Payment Option', style: Theme.of(context)
                                                                      .textTheme
                                                                      .headline5!
                                                                      .copyWith(
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                              Column(
                                                                children: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      'UPI: PhonePe, GooglePe, Paytm etc...',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                15,
                                                                            // fontWeight: FontWeight.bold,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize: Size(
                                                                          double
                                                                              .infinity,
                                                                          50),
                                                                      elevation:
                                                                          0,
                                                                      primary:
                                                                          Color(
                                                                              0xff00b04d),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          15),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      'Debit Card / Credit Card, Net Banking',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                15,
                                                                            // fontWeight: FontWeight.bold,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize: Size(
                                                                          double
                                                                              .infinity,
                                                                          50),
                                                                      elevation:
                                                                          0,
                                                                      primary:
                                                                          Color(
                                                                              0xff3a2720),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          25),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          'Note:\nSample Instructions',
                                                                          style: Theme.of(
                                                                              context)
                                                                              .textTheme
                                                                              .headline5!
                                                                              .copyWith(
                                                                            fontSize:
                                                                            15,
                                                                            // fontWeight: FontWeight.bold,
                                                                            color:
                                                                            Color(0xffe14942),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize: Size(
                                                                          double
                                                                              .infinity,
                                                                          50),
                                                                      elevation:
                                                                          0,
                                                                      primary:
                                                                          Colors
                                                                              .transparent,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xffe14942),
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('NO DATA'),
                      );
                    }
                  },
                ),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FadedSlideAnimation(
                FutureBuilder<FeePayHistory?>(
                  future: _feePayHistoryFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data != null) {
                      feePayHistory = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // flex: 3,
                            child: ListView(
                              children: [
                                Container(
                                  child: Material(
                                    elevation: 1.5,
                                    color: Colors.grey.shade300,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total Fee ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Text(
                                                'Paid ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Text(
                                                'Balance ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ': ${feePayHistory!.feePayHistoryData!.fixedFee}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Text(
                                                ': ${feePayHistory!.feePayHistoryData!.paidFee}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Text(
                                                ': ${feePayHistory!.feePayHistoryData!.balance}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/icons/ic_printer.png'),
                                              ),
                                            ),
                                          ),
                                          // SizedBox.shrink(
                                          //   child: Image.asset(
                                          //     'assets/icons/ic_printer.png',
                                          //     width: MediaQuery.of(context).size.width,
                                          //     // fit: BoxFit.fill,
                                          //     scale: 1,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.only(top: 8),
                                  itemCount: feePayHistory!
                                      .feePayHistoryData!.transaction!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReceiptScreen(
                                                orderId:
                                                    '${feePayHistory!.feePayHistoryData!.transaction![index].orderId}',
                                                sid:
                                                    '${feePayHistory!.feePayHistoryData!.transaction![index].studentId}',
                                              ),
                                            ),
                                          );
                                          print('history clicked');
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          // height: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[300]!,
                                                spreadRadius: 0.6,
                                                blurRadius: 0.6,
                                                offset: Offset.fromDirection(
                                                    0.75, 2.0),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 10,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Ref. No. : ' +
                                                            '${feePayHistory!.feePayHistoryData!.transaction![index].transactionId}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                              fontSize: 16,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        'Order No. : ' +
                                                            '${feePayHistory!.feePayHistoryData!.transaction![index].orderId}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                              fontSize: 16,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Mode: ' +
                                                                      '${feePayHistory!.feePayHistoryData!.transaction![index].mode}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText2!
                                                                      .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  'Rs. ' +
                                                                      '${feePayHistory!.feePayHistoryData!.transaction![index].amount}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText2!
                                                                      .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // SizedBox(width: 5),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Status: ' +
                                                                      paymentStatus(
                                                                          index),
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText2!
                                                                      .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  '${feePayHistory!.feePayHistoryData!.transaction![index].paymentDate}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText2!
                                                                      .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Column(
                                                          //   crossAxisAlignment: CrossAxisAlignment.start,
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xff737373),
                                                  size: 36,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('NO DATA'),
                      );
                    }
                  },
                ),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String paymentStatus(int index) {
    if (feePayHistory!.feePayHistoryData!.transaction![index].fundTransStatus ==
        'PAYMENT SUCCESS') {
      return 'SUCCESS';
    } else if (feePayHistory!
            .feePayHistoryData!.transaction![index].fundTransStatus ==
        'PAYMENT FAILED') {
      return 'FAILED';
    }
    return '';
  }

  String calcConveyanceFee() {
    if (feeFullJson!.conveyancetype == 'fixed') {
      return feeFullJson!.conveyancefee!;
    } else if (feeFullJson!.conveyancetype == 'percentage') {
      num percentage = totalFee * num.parse(feeFullJson!.conveyancefee!) / 100;
      return percentage.toString();
    }
    return '0';
  }

  Row buildItemProperty(
      BuildContext context, String title, Widget trailing1, Widget trailing2,
      {Color? textColor}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: textColor),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        // Spacer(
        //   flex: 1,
        // ),
        SizedBox(width: 20),
        GestureDetector(child: trailing1, onTap: () {}),
        // Spacer(),
        SizedBox(width: 40),
        GestureDetector(child: trailing2, onTap: () {}),
      ],
    );
  }

  Row myBuildItemProperty(BuildContext context, String title, Widget trailing1,
      {Color? textColor}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: textColor),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        // Spacer(
        //   flex: 1,
        // ),
        SizedBox(width: 15),
        GestureDetector(child: trailing1, onTap: () {}),
        SizedBox(width: 5),
      ],
    );
  }
}

// class Order {
//   String orderNo;
//   String price;
//   String image;
//   String? title;
//   String subtitle;
//
//   Order(this.orderNo, this.price, this.image, this.title, this.subtitle);
// }

// class FeeDetailsTabBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var locale = AppLocalizations.of(context)!;
//     final List<Order> _allOrders = [
//       Order('221454', '10.00', 'assets/imgs/Layer 1741.png',
//           locale.rechargeDone, 'AT&T +1 987 654 3210'),
//       Order('114578', '15.00', 'assets/imgs/Layer 1753.png',
//           locale.orderedSuccessful, 'Spyware White cotton Shirt'),
//       Order('998745', '9.00', 'assets/imgs/Layer 1773.png',
//           locale.electricityBillPaid, 'City Power Electricity Board'),
//       Order('221454', '14.00', 'assets/imgs/Layer 1741.png',
//           locale.rechargeDone, 'At&T +1 987 654 3210'),
//       Order('114578', '20.00', 'assets/imgs/Layer 1753.png',
//           locale.orderedSuccessful, 'Spyware White cotton Shirt'),
//       Order('998745', '10.00', 'assets/imgs/Layer 1773.png',
//           locale.electricityBillPaid, 'City Power Electricity Board'),
//     ];
//     return Container(
//       color: Theme.of(context).backgroundColor,
//       child: FadedSlideAnimation(
//         FutureBuilder<List<FeeList>>(
//           // future: _,
//           builder: (context, snapshot) {
//             return Center();
//           },
//         ),
//         beginOffset: Offset(0, 0.3),
//         endOffset: Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//       ),
//     );
//   }
//
//
// }
