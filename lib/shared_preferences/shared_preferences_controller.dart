import 'package:shared_preferences/shared_preferences.dart';

enum SPKeys {
  otpCode,
  firstVisit,
  loggedIn,
  id,
  name,
  mobile,
  gender,
  cityEn,
  cityAr,
  language,
  theme,
  token,
  noOfStd,
  totalFee,
}

class SharedPreferencesController {
  static final SharedPreferencesController _sharedPrefControllerObj =
      SharedPreferencesController._sharedPrefPrivateConstructor();

  SharedPreferencesController._sharedPrefPrivateConstructor();

  late SharedPreferences _sharedPrefLibObj;

  factory SharedPreferencesController() {
    return _sharedPrefControllerObj;
  }

  Future<void> initSharedPreferences() async {
    _sharedPrefLibObj = await SharedPreferences.getInstance();
  }

  Future<void> setTotalFee({required int totalFee}) async {
    await _sharedPrefLibObj.setInt(SPKeys.totalFee.toString(), totalFee);
  }

  int get getTotalFee =>
      _sharedPrefLibObj.getInt(SPKeys.totalFee.toString()) ?? 0;

  Future<void> setOtpCode({required int otpCode}) async {
    await _sharedPrefLibObj.setInt(SPKeys.otpCode.toString(), otpCode);
  }

  int get getOtpCode =>
      _sharedPrefLibObj.getInt(SPKeys.otpCode.toString()) ?? 0;

  Future<void> setLanguage({required String language}) async {
    await _sharedPrefLibObj.setString(SPKeys.language.toString(), language);
  }

  String get checkLanguage =>
      _sharedPrefLibObj.getString(SPKeys.language.toString()) ?? 'en';

  Future<void> setFirstVisit() async {
    await _sharedPrefLibObj.setBool(SPKeys.firstVisit.toString(), false);
  }

  bool get checkFirstVisit =>
      _sharedPrefLibObj.getBool(SPKeys.firstVisit.toString()) ?? true;

  // Future<void> save({required User user}) async {
  //   // await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), true);
  //   await _sharedPrefLibObj.setInt(SPKeys.id.toString(), user.id);
  //   await _sharedPrefLibObj.setString(SPKeys.name.toString(), user.name);
  //   await _sharedPrefLibObj.setString(SPKeys.mobile.toString(), user.mobile);
  //   await _sharedPrefLibObj.setString(SPKeys.gender.toString(), user.gender);
  //   await _sharedPrefLibObj.setString(
  //       SPKeys.cityAr.toString(), user.city.nameAr);
  //   await _sharedPrefLibObj.setString(
  //       SPKeys.cityEn.toString(), user.city.nameEn);
  // }

  Future<void> login() async {
    await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), true);
  }

  Future<void> setToken({required String token}) async {
    await _sharedPrefLibObj.setString(
        SPKeys.token.toString(), 'Bearer ' + token);
  }

  String get getName =>
      _sharedPrefLibObj.getString(SPKeys.name.toString()) ?? '';

  String get getMobile =>
      _sharedPrefLibObj.getString(SPKeys.mobile.toString()) ?? '';

  String get getGender =>
      _sharedPrefLibObj.getString(SPKeys.gender.toString()) ?? '';

  String get getCityEn =>
      _sharedPrefLibObj.getString(SPKeys.cityEn.toString()) ?? '';

  String get getCityAr =>
      _sharedPrefLibObj.getString(SPKeys.cityAr.toString()) ?? '';

  String get getToken =>
      _sharedPrefLibObj.getString(SPKeys.token.toString()) ?? '';

  bool get loggedIn =>
      _sharedPrefLibObj.getBool(SPKeys.loggedIn.toString()) ?? false;

  Future<bool> logout() async {
    return await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), false);
  }
}
//
// SharedPreferencesController().setstudentId1(studentId1: 'AISKGL1');
// SharedPreferencesController().setstdname1(stdname1: 'Aadvika G ');
// SharedPreferencesController().setschool_code1(school_code1: 'AISKGL');
// SharedPreferencesController().setschool_name1(school_name1: 'Arvind International School');
// SharedPreferencesController().setschool_logo1(school_logo1: '');
//
// SharedPreferencesController().setstudentId2(studentId2: 'AISKGL2');
// SharedPreferencesController().setstdname2(stdname2: 'Aditya M ');
// SharedPreferencesController().setschool_code2(school_code2: 'AISKGL');
// SharedPreferencesController().setschool_name2(school_name2: 'Arvind International School');
// SharedPreferencesController().setschool_logo2(school_logo2: '');
//
// SharedPreferencesController().setstudentId3(studentId3: 'AISKGL5595');
// SharedPreferencesController().setstdname3(stdname3: 'Sumanth N ');
// SharedPreferencesController().setschool_code3(school_code3: 'AISKGL');
// SharedPreferencesController().setschool_name3(school_name3: 'Arvind International School');
// SharedPreferencesController().setschool_logo3(school_logo3: '');
