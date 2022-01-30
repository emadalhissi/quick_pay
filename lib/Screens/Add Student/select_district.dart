import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_district_controller.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_state_controller.dart';
import 'package:quick_pay/Models/api_models/district.dart';
import 'package:quick_pay/Models/api_models/state.dart';
import 'package:quick_pay/Screens/Add%20Student/select_school.dart';
import 'package:quick_pay/Theme/colors.dart';

class SelectDistrictScreen extends StatefulWidget {
  final int stateId;

  const SelectDistrictScreen({
    Key? key,
    required this.stateId,
  }) : super(key: key);

  @override
  _SelectDistrictScreenState createState() => _SelectDistrictScreenState();
}

class _SelectDistrictScreenState extends State<SelectDistrictScreen> {
  late List<District> _districtList = <District>[];
  late Future<List<District>> _districtFuture;

  late TextEditingController districtEditingController;

  @override
  void initState() {
    super.initState();
    _districtFuture = GetDistrictController()
        .getDistrictList(context, stateId: widget.stateId);
    districtEditingController = TextEditingController();
  }

  @override
  void dispose() {
    districtEditingController.dispose();
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
          'DISTRICT',
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
              controller: districtEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.only(start: 12),
                hintText: 'Search District',
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
          FutureBuilder<List<District>>(
            future: _districtFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _districtList = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _districtList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectSchoolScreen(stateId: widget.stateId,
                                districtIId: _districtList[index].districtId!),
                          ),
                        );
                      },
                      title: Text('${_districtList[index].districtName}'),
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
