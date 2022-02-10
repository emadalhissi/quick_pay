import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_pay/API/Controllers/Fee%20Full%20Process/Fee%20History/download_receipt_controller.dart';
import 'package:quick_pay/Models/api_models/download_receipt.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share_extend/share_extend.dart';

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
  late bool isLoading;
  bool _allowWriteFile = false;

  String progress = '';
  late Dio dio;

  requestWritePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        _allowWriteFile = true;
      });
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }

  Future<String> getDirectoryPath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory = await Directory(appDocDirectory.path + '/' + 'dir')
        .create(recursive: true);

    return directory.path;
  }

  Future downloadFile(String url, path) async {
    if (!_allowWriteFile) {
      requestWritePermission();
    }
    try {
      ProgressDialog progressDialog = ProgressDialog(
        context,
        dialogTransitionType: DialogTransitionType.Bubble,
        title: Text('Downloading File'),
      );

      progressDialog.show();

      await dio.download(url, path, onReceiveProgress: (rec, total) {
        setState(() {
          isLoading = true;
          progress = ((rec / total) * 100).toStringAsFixed(0) + '%';
          progressDialog.setMessage(Text('Downloading $progress'));
        });
      });
      progressDialog.dismiss();
    } catch (e) {
      print(e.toString());
    }
  }

  late DownloadReceipt? receipt;
  late Future<DownloadReceipt?> _receiptFuture;

  @override
  void initState() {
    super.initState();

    dio = Dio();
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
            // onTap: () async {
            //   print('receipt!.data : ${receipt!.data}');
            //   await Share.share('${receipt!.data}');
            // },

            onTap: () {
              String url = '${receipt!.data}';
              print('$url');
              String extension=url.substring(url.lastIndexOf('/'));

              getDirectoryPath().then((path) {

                File f = File(path + '$extension');
                print('extension: $extension');
                // if (f.existsSync()) {
                //   print('before');
                // //
                //   // await FlutterShare.shareFile(
                //   //     title: 'PSF Share', filePath: '${f.path}');
                //   print('after');
                //   // Navigator.push(context, MaterialPageRoute(builder: (context) => PDFTestScreen(file: f),));
                //
                //   // await Share.share('${f.path}');
                //   // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   //   return PDFScreen(f.path);
                //   // }));
                //   return;
                // }

                downloadFile(url, '$path/$extension');
                ShareExtend.share(f.path, "file");
              });
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
