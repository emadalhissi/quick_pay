import 'package:flutter/material.dart';
import 'package:quick_pay/API/Controllers/Fee%20Full%20Process/Fee%20History/download_receipt_controller.dart';
import 'package:quick_pay/Models/api_models/download_receipt.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:share_plus/share_plus.dart';

class ReceiptScreen extends StatefulWidget {
  final String orderId;
  final String sid;
  final String transactionId;

  const ReceiptScreen({
    Key? key,
    required this.orderId,
    required this.sid,
    required this.transactionId,
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
    _receiptFuture = DownloadReceiptController()
        .getReceipt(context, orderId: widget.orderId, sid: widget.sid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.transactionId}',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          InkWell(
            onTap: () async {
              print('receipt!.data : ${receipt!.data}');
              await Share.share('${receipt!.data}');
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 16),
              child: Icon(Icons.share),
            ),
          ),
        ],
      ),
      body: FutureBuilder<DownloadReceipt?>(
        future: _receiptFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data != null) {
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
