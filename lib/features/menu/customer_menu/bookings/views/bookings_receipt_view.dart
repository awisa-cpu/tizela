import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../../../utils/loaders/app_future_loaders.dart';

class BookingsReceiptView extends StatelessWidget {
  final Future<File> pdfFutureOperation;
  const BookingsReceiptView({
    super.key,
    required this.pdfFutureOperation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: true,
        title: Text(
          "E-Receipt",
          style: customTextStyle(fontSize: 16),
        ),
      ),
      body: FutureBuilder(
        future: pdfFutureOperation,
        builder: (context, snapshot) {
          final widgetToShow = AppFutureLoaders.checkSingleFutureState(
            snapshot: snapshot,
            errorWidget: Center(
              child: Text(
                "An error occured while loading pdf",
                style: customTextStyle(),
              ),
            ),
          );

          if (widgetToShow != null) {
            return widgetToShow;
          }

          final file = snapshot.data!;

          return PDFView(
            filePath: file.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            onRender: (pages) => AppDebugger.debugger("Rendered $pages pages"),
            onError: (error) => AppDebugger.debugger("Error: $error"),
            onPageError: (page, error) =>
                AppDebugger.debugger("Page $page Error: $error"),
          );
        },
      ),
    );
  }
}
