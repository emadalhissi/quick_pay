import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/register_controller.dart';
import 'package:quick_pay/API/api_helper.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Models/api_models/api_base_response.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:quick_pay/Theme/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ApiHelper {
  late TextEditingController _institutionNameEditingController;
  late TextEditingController _addressEditingController;
  late TextEditingController _stateEditingController;
  late TextEditingController _districtEditingController;
  late TextEditingController _cityEditingController;
  late TextEditingController _pinCodeEditingController;
  late TextEditingController _contactPersonEditingController;
  late TextEditingController _designationEditingController;
  late TextEditingController _whatsAppNumberEditingController;
  late TextEditingController _contactNumberEditingController;
  late TextEditingController _descriptionEditingController;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _institutionNameEditingController = TextEditingController();
    _addressEditingController = TextEditingController();
    _stateEditingController = TextEditingController();
    _districtEditingController = TextEditingController();
    _cityEditingController = TextEditingController();
    _pinCodeEditingController = TextEditingController();
    _contactPersonEditingController = TextEditingController();
    _designationEditingController = TextEditingController();
    _whatsAppNumberEditingController = TextEditingController();
    _contactNumberEditingController = TextEditingController();
    _descriptionEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _institutionNameEditingController.dispose();
    _addressEditingController.dispose();
    _stateEditingController.dispose();
    _districtEditingController.dispose();
    _cityEditingController.dispose();
    _pinCodeEditingController.dispose();
    _contactPersonEditingController.dispose();
    _designationEditingController.dispose();
    _whatsAppNumberEditingController.dispose();
    _contactNumberEditingController.dispose();
    _descriptionEditingController.dispose();
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
          'REGISTER',
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
                  height: 30,
                ),
                Center(
                  child: Text(
                    'School Registration Form',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xffe9463d),
                        ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'Didn\'t find your institute?',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        // fontWeight: FontWeight.w700,
                        // fontSize: 20,
                        // color: Color(0xffe9463d),
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    '[Please fill out the below information to register for school with BBPS]',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        // fontWeight: FontWeight.w700,
                        // fontSize: 20,
                        // color: Color(0xffe9463d),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Institution Name:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _institutionNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Institution Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Address:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _addressEditingController,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'State:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _stateEditingController,
                  decoration: InputDecoration(
                    hintText: 'State',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'District:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _districtEditingController,
                  decoration: InputDecoration(
                    hintText: 'District',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'City:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _cityEditingController,
                  decoration: InputDecoration(
                    hintText: 'City',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Pincode:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _pinCodeEditingController,
                  decoration: InputDecoration(
                    hintText: 'Pincode',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Contact Person:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _contactPersonEditingController,
                  decoration: InputDecoration(
                    hintText: 'Contact Person',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Designation:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _designationEditingController,
                  decoration: InputDecoration(
                    hintText: 'Designation',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'WhatsApp Number:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _whatsAppNumberEditingController,
                  decoration: InputDecoration(
                    hintText: 'WhatsApp Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Contact Number:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _contactNumberEditingController,
                  decoration: InputDecoration(
                    hintText: 'Contact Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 5),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // fontWeight: FontWeight.w700,
                      // fontSize: 20,
                      // color: Color(0xffe9463d),
                      ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _descriptionEditingController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    await performRegister();
                  },
                  child: CustomButton(
                    'REGISTER',
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

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_institutionNameEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Name is required!',
        error: true,
      );
      return false;
    } else if (_addressEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Address is required!',
        error: true,
      );
      return false;
    } else if (_stateEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'State is required!',
        error: true,
      );
      return false;
    } else if (_districtEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'District is required!',
        error: true,
      );
      return false;
    } else if (_cityEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'City is required!',
        error: true,
      );
      return false;
    } else if (_pinCodeEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Pincode is required!',
        error: true,
      );
      return false;
    } else if (_contactPersonEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Contact Person is required!',
        error: true,
      );
      return false;
    } else if (_designationEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Designation is required!',
        error: true,
      );
      return false;
    } else if (_whatsAppNumberEditingController.text.isNotEmpty &&
        _whatsAppNumberEditingController.text.length != 10) {
      showSnackBar(
        context,
        message: 'WhatsApp Number must be 10 digits!',
        error: true,
      );
      return false;
    } else if (_contactNumberEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Contact Number is required!',
        error: true,
      );
      return false;
    } else if (_contactNumberEditingController.text.length != 10) {
      showSnackBar(
        context,
        message: 'Contact Number must be 10 digits!',
        error: true,
      );
      return false;
    }
    return true;
  }

  Future<void> register() async {
    print('check from register++');
    setState(() {
      loading = true;
    });
    BaseApiResponse? baseApiResponse = await RegisterController().register(
      context,
      institutionName: _institutionNameEditingController.text,
      address: _addressEditingController.text,
      state: _stateEditingController.text,
      district: _districtEditingController.text,
      city: _cityEditingController.text,
      pinCode: int.parse(_pinCodeEditingController.text),
      contactPerson: _contactPersonEditingController.text,
      designation: _designationEditingController.text,
      whatsAppNumber: _whatsAppNumberEditingController.text,
      contactNumber: int.parse(_contactNumberEditingController.text),
      description: _descriptionEditingController.text,
    );

    if (baseApiResponse != null) {
      print('baseApiResponse != null');

      setState(() {
        loading = false;
      });
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }
}
