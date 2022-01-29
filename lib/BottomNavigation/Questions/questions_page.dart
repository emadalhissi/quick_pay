import 'package:flutter/material.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Theme/colors.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> with ApiHelper {
  late TextEditingController _questionEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questionEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
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
    );
  }

  Future<void> performSubmitQuestion() async {
    if (checkData()) {
      await submitQuestion();
    }
  }

  bool checkData() {
    if (_questionEditingController.text.isEmpty) {
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
      // loading = true;
    });
  }
}
