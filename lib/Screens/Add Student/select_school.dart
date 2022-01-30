import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_district_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_school_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_state_controller.dart';
import 'package:quick_pay/Models/api_models/district.dart';
import 'package:quick_pay/Models/api_models/school.dart';
import 'package:quick_pay/Models/api_models/state.dart';
import 'package:quick_pay/Screens/Add%20Student/enter_mobile.dart';
import 'package:quick_pay/Theme/colors.dart';

class SelectSchoolScreen extends StatefulWidget {
  final int stateId;
  final int districtIId;

  const SelectSchoolScreen({
    Key? key,
    required this.stateId,
    required this.districtIId,
  }) : super(key: key);

  @override
  _SelectSchoolScreenState createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen> {
  late List<School> _schoolList = <School>[];
  late Future<List<School>> _schoolFuture;

  late TextEditingController schoolEditingController;

  @override
  void initState() {
    super.initState();
    _schoolFuture = GetSchoolController()
        .getSchoolList(context, districtId: widget.districtIId);
    schoolEditingController = TextEditingController();
  }

  @override
  void dispose() {
    schoolEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 2,
        title: Text(
          'SCHOOL',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: schoolEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.only(start: 12),
                hintText: 'Search School',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          FutureBuilder<List<School>>(
            future: _schoolFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _schoolList = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _schoolList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterMobileScreen(
                              stateId: widget.stateId,
                              districtIId: widget.districtIId,
                              schoolId: _schoolList[index].schoolId.toString(),
                            ),
                          ),
                        );
                      },
                      title: Text('${_schoolList[index].schoolName}'),
                    );
                  },
                );
              } else {
                return Center();
              }
            },
          )
        ],
      ),
    );
  }
}
