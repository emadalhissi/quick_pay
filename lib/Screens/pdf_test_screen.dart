import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFTestScreen extends StatelessWidget {
  // final String pathPDF;
  final File file;

  const PDFTestScreen({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SfPdfViewer.file(file),
    );
  }
}