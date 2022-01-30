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
      body: Column(
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
              keyboardType: TextInputType.number,
            ),
          ),
          FutureBuilder<List<StateModel>>(
            future: _stateFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _stateList = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _stateList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDistrictScreen(stateId: _stateList[index].stateId!)));
                      },
                      title: Text('${_stateList[index].stateName}'),
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

//
//
// class SearchListExample extends StatefulWidget {
//   @override
//   _SearchListExampleState createState() => new _SearchListExampleState();
// }
//
// class _SearchListExampleState extends State<SearchListExample> {
//   Widget appBarTitle = new Text(
//     "Search Example",
//     style: new TextStyle(color: Colors.white),
//   );
//   Icon icon = new Icon(
//     Icons.search,
//     color: Colors.white,
//   );
//   final globalKey = new GlobalKey<ScaffoldState>();
//   final TextEditingController _controller = new TextEditingController();
//   List<dynamic> _list;
//   bool _isSearching;
//   String _searchText = "";
//   List searchresult = new List();
//
//   _SearchListExampleState() {
//     _controller.addListener(() {
//       if (_controller.text.isEmpty) {
//         setState(() {
//           _isSearching = false;
//           _searchText = "";
//         });
//       } else {
//         setState(() {
//           _isSearching = true;
//           _searchText = _controller.text;
//         });
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _isSearching = false;
//     values();
//   }
//
//   void values() {
//     _list = List();
//     _list.add("Indian rupee");
//     _list.add("United States dollar");
//     _list.add("Australian dollar");
//     _list.add("Euro");
//     _list.add("British pound");
//     _list.add("Yemeni rial");
//     _list.add("Japanese yen");
//     _list.add("Hong Kong dollar");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         key: globalKey,
//         appBar: buildAppBar(context),
//         body: new Container(
//           child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               new Flexible(
//                   child: searchresult.length != 0 || _controller.text.isNotEmpty
//                       ? new ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: searchresult.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       String listData = searchresult[index];
//                       return new ListTile(
//                         title: new Text(listData.toString()),
//                       );
//                     },
//                   )
//                       : new ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: _list.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       String listData = _list[index];
//                       return new ListTile(
//                         title: new Text(listData.toString()),
//                       );
//                     },
//                   ))
//             ],
//           ),
//         ));
//   }
//
//   Widget buildAppBar(BuildContext context) {
//     return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
//       new IconButton(
//         icon: icon,
//         onPressed: () {
//           setState(() {
//             if (this.icon.icon == Icons.search) {
//               this.icon = new Icon(
//                 Icons.close,
//                 color: Colors.white,
//               );
//               this.appBarTitle = new TextField(
//                 controller: _controller,
//                 style: new TextStyle(
//                   color: Colors.white,
//                 ),
//                 decoration: new InputDecoration(
//                     prefixIcon: new Icon(Icons.search, color: Colors.white),
//                     hintText: "Search...",
//                     hintStyle: new TextStyle(color: Colors.white)),
//                 onChanged: searchOperation,
//               );
//               _handleSearchStart();
//             } else {
//               _handleSearchEnd();
//             }
//           });
//         },
//       ),
//     ]);
//   }
//
//   void _handleSearchStart() {
//     setState(() {
//       _isSearching = true;
//     });
//   }
//
//   void _handleSearchEnd() {
//     setState(() {
//       this.icon = new Icon(
//         Icons.search,
//         color: Colors.white,
//       );
//       this.appBarTitle = new Text(
//         "Search Sample",
//         style: new TextStyle(color: Colors.white),
//       );
//       _isSearching = false;
//       _controller.clear();
//     });
//   }
//
//   void searchOperation(String searchText) {
//     searchresult.clear();
//     if (_isSearching != null) {
//       for (int i = 0; i < _list.length; i++) {
//         String data = _list[i];
//         if (data.toLowerCase().contains(searchText.toLowerCase())) {
//           searchresult.add(data);
//         }
//       }
//     }
//   }
// }
