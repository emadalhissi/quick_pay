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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}