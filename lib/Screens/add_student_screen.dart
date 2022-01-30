import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:quick_pay/Theme/colors.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class States {
  int? id;
  String? name;

  States(this.id, this.name);
}

class _AddStudentScreenState extends State<AddStudentScreen> with ApiHelper {
  late TextEditingController _mobileEditingController;

  int stateId = 1;
  int cityOrDistrictId = 1;
  int instituteId = 1;
  int countryId = 1;
  List<States> test = <States>[
    States(1, 'Test 1'),
    States(2, 'Test 2'),
    States(3, 'Test 3'),
  ];

  @override
  void initState() {
    super.initState();
    _mobileEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 2,
        title: Text(
          'ADD STUDENT',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Select State:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        value: stateId,
                        onChanged: (int? newStateValue) {
                          setState(() {
                            stateId = newStateValue!;
                          });
                        },
                        items: test.map((e) {
                          return DropdownMenuItem(
                            child: Text('${e.name}'),
                            value: e.id,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select City/District:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        value: cityOrDistrictId,
                        onChanged: (int? newCityValue) {
                          setState(() {
                            cityOrDistrictId = newCityValue!;
                          });
                        },
                        items: test.map((e) {
                          return DropdownMenuItem(
                            child: Text('${e.name}'),
                            value: e.id,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select Institute:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        value: instituteId,
                        onChanged: (int? newInstituteValue) {
                          setState(() {
                            instituteId = newInstituteValue!;
                          });
                        },
                        items: test.map((e) {
                          return DropdownMenuItem(
                            child: Text('${e.name}'),
                            value: e.id,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select Country:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        value: countryId,
                        onChanged: (int? newCountryValue) {
                          setState(() {
                            countryId = newCountryValue!;
                          });
                        },
                        items: test.map((e) {
                          return DropdownMenuItem(
                            child: Text('${e.name}'),
                            value: e.id,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter Registered Mobile Number:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _mobileEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 12),
                    hintText: 'Mobile Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: InkWell(
              onTap: () async {
                await performAddStudent();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  'CONTINUE',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performAddStudent() async {
    if (checkData()) {
      await add();
    }
  }

  bool checkData() {

    return true;
  }

  Future<void> add() async {
    print('check from add++');
    setState(() {
      // loading = true;
    });
  }
}
