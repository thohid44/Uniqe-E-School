import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class ReadBook extends StatefulWidget {
  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var book = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Read Book"),
        ),
        body: SfPdfViewer.network(
          "https://uniqueeschool.com/images/books/$book",
          key: _pdfViewerKey,
        ));
  }
}
