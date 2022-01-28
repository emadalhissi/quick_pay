import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/download_receipt_controller.dart';
import 'package:quick_pay/Models/api_models/download_receipt.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReceiptScreen extends StatefulWidget {
  final String orderId;
  final String sid;

  const ReceiptScreen({
    Key? key,
    required this.orderId,
    required this.sid,
  }) : super(key: key);

  @override
  _ReceiptScreenState createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {

  late DownloadReceipt? receipt;
  late Future<DownloadReceipt?> _receiptFuture;

  @override
  void initState() {
    super.initState();
    _receiptFuture = DownloadReceiptController().getReceipt(context, orderId: widget.orderId, sid: widget.sid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DownloadReceipt?>(
        future: _receiptFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.data != null) {
            print('_receiptFuture != null');
            receipt = snapshot.data;
            return SfPdfViewer.network('${receipt!.data}');
          } else {
            return Center(
              child: Text('NO DATA'),
            );
          }
        },
      ),
    );
  }
}
