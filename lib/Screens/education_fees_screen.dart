import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/get_fee_list.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/my_custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Models/api_models/fee_full_json.dart';
import 'package:quick_pay/Models/api_models/fee_list.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/Theme/style.dart';

class EducationFeesScreen extends StatefulWidget {
  @override
  _EducationFeesScreenState createState() => _EducationFeesScreenState();
}

class _EducationFeesScreenState extends State<EducationFeesScreen> {
  var myMenuItems = <String>[];

  late FeeFullJson? feeFullJson;
  late Future<FeeFullJson?> _future;
  bool _isChecked = false;
  late TextEditingController feeEditingController;

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
    _future = GetFeeList().getFeeList(context, id: 'VPSUDP1298');
    feeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    feeEditingController.dispose();
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
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data != null) {
                      feeFullJson = snapshot.data;
                      // List<bool> _checkBoxes = <bool>();
                      // _isCheckedList = List.generate(feeFullJson!.data!.length, (index) => _isChecked);
                      // var _isCheckedArray = List<bool>.filled(
                      //     feeFullJson!.data!.length, false,
                      //     growable: true);
                      return Stack(
                        children: [
                          ListView(
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
                                padding: EdgeInsets.symmetric(vertical: 8),
                                itemCount: feeFullJson!.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Material(
                                      elevation: 0.8,
                                      child: Padding(
                                        padding: EdgeInsets.zero,
                                        child: CheckboxListTile(
                                          activeColor: feeFullJson!.data![index]
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
                                              _isCheckedList[index] =
                                                  !_isCheckedList[index];
                                            });
                                          },
                                          title: myBuildItemProperty(
                                            context,
                                            feeFullJson!.data![index].subFee!,
                                            // 'fed',
                                            Text(
                                              feeFullJson!.data![index].orderBy!
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
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
                          Column(
                            children: [
                              Expanded(child: Center()),
                              Container(
                                color: Colors.transparent,
                                width: double.infinity,
                                // height: 50,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: feeEditingController,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      'Conveyance Fee: ${feeFullJson!.conveyancefee}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: 10),
                                    MyCustomButton('PAY NOW'),
                                  ],
                                ),
                              ),
                            ],
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
                FutureBuilder<FeeFullJson?>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data != null) {
                      feeFullJson = snapshot.data;
                      // List<bool> _checkBoxes = <bool>();
                      // _isCheckedList = List.generate(feeFullJson!.data!.length, (index) => _isChecked);
                      // var _isCheckedArray = List<bool>.filled(
                      //     feeFullJson!.data!.length, false,
                      //     growable: true);
                      return ListView(
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
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemCount: feeFullJson!.data!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CheckboxListTile(
                                    activeColor:
                                        feeFullJson!.data![index].isMandatory ==
                                                1
                                            ? Color(0xffbdbdbd)
                                            : Color(0xff1976d3),
                                    tristate: true,
                                    value:
                                        feeFullJson!.data![index].isMandatory ==
                                                1
                                            ? true
                                            : _isCheckedList[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _isCheckedList[index] =
                                            !_isCheckedList[index];
                                      });
                                    },
                                    title: buildItemProperty(
                                      context,
                                      feeFullJson!.data![index].subFee!,
                                      // 'fed',
                                      Text(
                                        feeFullJson!.data![index].orderBy!
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox.shrink(),
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
                              );
                            },
                          ),
                          // Container(
                          //   color: Colors.red,
                          //   width: double.infinity,
                          //   height: 50,
                          // ),
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

            // FeeDetailsTabBar(),
          ],
        ),
      ),
    );
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
        SizedBox(width: 20),
        GestureDetector(child: trailing1, onTap: () {}),
        SizedBox(width: 15),
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
