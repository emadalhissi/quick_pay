import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/ask_question_controller.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Models/api_models/api_base_response.dart';
import 'package:quick_pay/Theme/colors.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> with ApiHelper {
  late TextEditingController _userNameEditingController;
  late TextEditingController _mobileEditingController;
  late TextEditingController _questionEditingController;

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userNameEditingController = TextEditingController();
    _mobileEditingController = TextEditingController();
    _questionEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameEditingController.dispose();
    _mobileEditingController.dispose();
    _questionEditingController.dispose();
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
          'Ask Question',
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
                  height: 15,
                ),
                Text(
                  'User Name',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                        // fontSize: 20,
                        // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _userNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Mobile Number',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                        // fontSize: 20,
                        // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _mobileEditingController,
                  decoration: InputDecoration(
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
                SizedBox(height: 15),
                Text(
                  'Your Question',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                        // fontSize: 20,
                        // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _questionEditingController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Type your question',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    await performSubmitQuestion();
                  },
                  child: CustomButton(
                    'SUBMIT',
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          loading == true
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Future<void> performSubmitQuestion() async {
    if (checkData()) {
      await submitQuestion();
    }
  }

  bool checkData() {
    if (_userNameEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter User Name!',
        error: true,
        margin: 150,
      );
      return false;
    } else if (_mobileEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter Mobile Number!',
        error: true,
        margin: 150,
      );
      return false;
    } else if (_mobileEditingController.text.length != 10) {
      showSnackBar(
        context,
        message: 'Mobile Number must be 10 digits!',
        error: true,
        margin: 150,
      );
      return false;
    } else if (_questionEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Please Enter Your Question!',
        error: true,
        margin: 150,
      );
      return false;
    }
    return true;
  }

  Future<void> submitQuestion() async {
    print('check from submit Question++');
    setState(() {
      loading = true;
    });
    BaseApiResponse? baseApiResponse =
        await AskQuestionController().askQuestion(
      context,
      userName: _userNameEditingController.text,
      mobileNumber: int.parse(_mobileEditingController.text),
      question: _questionEditingController.text,
    );
    if (baseApiResponse != null) {
      setState(() {
        loading = false;
      });
      print('baseApiResponse != null');
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AppNavigation(),
          ),
        );
      });
    }
  }
}
