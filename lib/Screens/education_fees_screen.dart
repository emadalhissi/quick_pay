import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/get_fee_list.dart';
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

  // var _isCheckedArray;

  @override
  void initState() {
    super.initState();
    _future = GetFeeList().getFeeList(context, id: 'VPSUDP1298');
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
                      // _isCheckedArray = List.generate(feeFullJson!.data!.length, (index) => _isChecked);
                      var _isCheckedArray = List<bool>.filled(
                          feeFullJson!.data!.length, false,
                          growable: true);
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
                          CheckboxListTile(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            title: buildItemProperty(
                              context,
                              // _feeList[index].subFee != null ? _feeList[index].subFee! : '',
                              'dddd',
                              Text(
                                'ccc'
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
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
                          ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemCount: feeFullJson!.data!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 0.5,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 16),
                                  child: buildItemProperty(
                                    context,
                                    // _feeList[index].subFee != null ? _feeList[index].subFee! : '',
                                    feeFullJson!.data![index].subFee!,
                                    Text(
                                      feeFullJson!.data![index].orderBy!
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Checkbox(
                                        value: feeFullJson!
                                                    .data![index].isMandatory ==
                                                1
                                            ? true
                                            : _isCheckedArray[index],
                                        onChanged: feeFullJson!
                                                    .data![index].isMandatory ==
                                                1
                                            ? null
                                            : (value) {
                                                setState(
                                                  () {
                                                    _isCheckedArray[index] =
                                                        value!;
                                                  },
                                                );
                                              },
                                        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
            Center(),
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
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: textColor),
            overflow: TextOverflow.ellipsis,
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
