import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Add%20Student/get_state_controller.dart';
import 'package:quick_pay/Models/api_models/state.dart';
import 'package:quick_pay/Screens/Add%20Student/select_district.dart';
import 'package:quick_pay/Theme/colors.dart';

class SelectStateScreen extends StatefulWidget {
  const SelectStateScreen({Key? key}) : super(key: key);

  @override
  _SelectStateScreenState createState() => _SelectStateScreenState();
}

class _SelectStateScreenState extends State<SelectStateScreen> {
  late List<StateModel> _stateList = <StateModel>[];
  late Future<List<StateModel>> _stateFuture;

  late TextEditingController stateEditingController;
  List<StateModel> searchResult = <StateModel>[];

  @override
  void initState() {
    super.initState();
    _stateFuture = GetStateController().getStateList(context);
    stateEditingController = TextEditingController();
  }

  @override
  void dispose() {
    stateEditingController.dispose();
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
          'STATE',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FutureBuilder<List<StateModel>>(
        future: _stateFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _stateList = snapshot.data ?? [];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: stateEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(start: 12),
                      hintText: 'Search State',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    onChanged: (String searchText) {
                      setState(() {
                        searchResult.clear();
                        for (int i = 0; i < _stateList.length; i++) {
                          if (_stateList[i]
                              .stateName!
                              .toLowerCase()
                              .contains(searchText.toLowerCase())) {
                            print('check change');
                            searchResult.add(_stateList[i]);
                          }
                        }
                      });
                    },
                  ),
                ),
                searchResult.length != 0 ||
                        stateEditingController.text.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchResult.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectDistrictScreen(
                                      stateId: searchResult[index].stateId!),
                                ),
                              );
                            },
                            title: Text('${searchResult[index].stateName}'),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _stateList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectDistrictScreen(
                                      stateId: _stateList[index].stateId!),
                                ),
                              );
                            },
                            title: Text('${_stateList[index].stateName}'),
                          );
                        },
                      ),
              ],
            );
          } else {
            return Center(
              child: Text('NO STATES FOUND'),
            );
          }
        },
      ),
    );
  }
}
