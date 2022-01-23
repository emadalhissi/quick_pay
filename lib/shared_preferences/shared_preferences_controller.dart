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
}

enum studentDetailsKeys {
  studentId1,
  studentId2,
  studentId3,
  stdname1,
  stdname2,
  stdname3,
  school_code1,
  school_code2,
  school_code3,
  school_name1,
  school_name2,
  school_name3,
  school_logo1,
  school_logo2,
  school_logo3,
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

  //-------------------------------

  Future<void> setstudentId1({required String studentId1}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.studentId1.toString(), studentId1);
  }

  String get getstudentId1 => _sharedPrefLibObj.getString(studentDetailsKeys.studentId1.toString()) ?? '';

  Future<void> setstudentId2({required String studentId2}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.studentId2.toString(), studentId2);
  }

  String get getstudentId2 => _sharedPrefLibObj.getString(studentDetailsKeys.studentId2.toString()) ?? '';

  Future<void> setstudentId3({required String studentId3}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.studentId3.toString(), studentId3);
  }

  String get getstudentId3 => _sharedPrefLibObj.getString(studentDetailsKeys.studentId3.toString()) ?? '';

  Future<void> setstdname1({required String stdname1}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.stdname1.toString(), stdname1);
  }

  String get getstdname1 => _sharedPrefLibObj.getString(studentDetailsKeys.stdname1.toString()) ?? '';

  Future<void> setstdname2({required String stdname2}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.stdname2.toString(), stdname2);
  }

  String get getstdname2 => _sharedPrefLibObj.getString(studentDetailsKeys.stdname2.toString()) ?? '';

  Future<void> setstdname3({required String stdname3}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.stdname3.toString(), stdname3);
  }

  String get getstdname3 => _sharedPrefLibObj.getString(studentDetailsKeys.stdname3.toString()) ?? '';

  Future<void> setschool_code1({required String school_code1}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_code1.toString(), school_code1);
  }

  String get school_code1 => _sharedPrefLibObj.getString(studentDetailsKeys.school_code1.toString()) ?? '';

  Future<void> setschool_code2({required String school_code2}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_code2.toString(), school_code2);
  }

  String get school_code2 => _sharedPrefLibObj.getString(studentDetailsKeys.school_code2.toString()) ?? '';

  Future<void> setschool_code3({required String school_code3}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_code3.toString(), school_code3);
  }

  String get school_code3 => _sharedPrefLibObj.getString(studentDetailsKeys.school_code3.toString()) ?? '';

  Future<void> setschool_name1({required String school_name1}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_name1.toString(), school_name1);
  }

  String get school_name1 => _sharedPrefLibObj.getString(studentDetailsKeys.school_name1.toString()) ?? '';

  Future<void> setschool_name2({required String school_name2}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_name2.toString(), school_name2);
  }

  String get school_name2 => _sharedPrefLibObj.getString(studentDetailsKeys.school_name2.toString()) ?? '';

  Future<void> setschool_name3({required String school_name3}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_name3.toString(), school_name3);
  }

  String get school_name3 => _sharedPrefLibObj.getString(studentDetailsKeys.school_name3.toString()) ?? '';

  Future<void> setschool_logo1({required String school_logo1}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_logo1.toString(), school_logo1);
  }

  String get school_logo1 => _sharedPrefLibObj.getString(studentDetailsKeys.school_logo1.toString()) ?? '';

  Future<void> setschool_logo2({required String school_logo2}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_logo2.toString(), school_logo2);
  }

  String get school_logo2 => _sharedPrefLibObj.getString(studentDetailsKeys.school_logo2.toString()) ?? '';

  Future<void> setschool_logo3({required String school_logo3}) async {
    await _sharedPrefLibObj.setString(studentDetailsKeys.school_logo3.toString(), school_logo3);
  }

  String get school_logo3 => _sharedPrefLibObj.getString(studentDetailsKeys.school_logo3.toString()) ?? '';
  //-------------------------------
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
