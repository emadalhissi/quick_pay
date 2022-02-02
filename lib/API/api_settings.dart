class ApiSettings {

  static const String _baseUrl = 'https://payitseasy.com/feepay/';
  static const String _apiBaseUrl = _baseUrl + 'dataapi.php?';

  static const String getStdDetailsByMobile = _apiBaseUrl + 'action=getStdDetailsByMobile';
  static const String feepayHistory1 = _apiBaseUrl + 'action=feepayHistory1';
  static const String getFeeList = _apiBaseUrl + 'action=getFeeList';
  static const String downloadReceipt = _apiBaseUrl + 'action=downloadReceipt';

  static const String stateList = _apiBaseUrl + 'action=feepayStateList';
  static const String districtList = _apiBaseUrl + 'action=feepayDistrictList';
  static const String schoolList = _apiBaseUrl + 'action=feepaySchoolList';
  static const String getStdDetails = _apiBaseUrl + 'action=getStdDetails';

  static const String saveQuestions = _apiBaseUrl + 'action=saveQuestions';
  static const String feepayRegistration = _apiBaseUrl + 'action=feepayRegistration';

  static const String initiatePayment = _apiBaseUrl + 'action=initiatePayment1';
  static const String iciciQRCode = _apiBaseUrl + 'action=iciciQRCode';
}