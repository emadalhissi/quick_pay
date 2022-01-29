class DownloadReceipt {
  int? resultCode;
  String? data;
  String? message;

  DownloadReceipt({this.resultCode, this.data, this.message});

  DownloadReceipt.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'];
    message = json['message'];
  }
}