class ApiSettings {

  static const String _baseUrl = 'https://payitseasy.com/feepay/';
  static const String _apiBaseUrl = _baseUrl + 'dataapi.php?';

  static const String getStdDetailsByMobile = _apiBaseUrl + 'action=getStdDetailsByMobile';
  static const String feepayHistory1 = _apiBaseUrl + 'action=feepayHistory1';
  static const String getFeeList = _apiBaseUrl + 'action=getFeeList';
  static const String getStdDetails = _apiBaseUrl + 'action=getStdDetails';
}