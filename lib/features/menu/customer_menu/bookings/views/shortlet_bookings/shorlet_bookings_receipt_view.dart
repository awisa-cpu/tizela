import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

class ShorletBookingsReceiptView extends StatelessWidget {
  final String receiptFilePath;
  const ShorletBookingsReceiptView({super.key, required this.receiptFilePath});

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
      body: PDFView(
        filePath: receiptFilePath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
        onRender: (pages) => AppDebugger.debugger("Rendered $pages pages"),
        onError: (error) => AppDebugger.debugger("Error: $error"),
        onPageError: (page, error) =>
            AppDebugger.debugger("Page $page Error: $error"),
      ),
    );
  }
}
