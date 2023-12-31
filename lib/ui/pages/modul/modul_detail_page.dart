import 'package:flutter/material.dart';
import 'package:lahantani/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class ModulDetailPage extends StatelessWidget {
  final String pdfUrl;

  ModulDetailPage({required this.pdfUrl});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "can not launch url";
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'PDF Viewer',
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.download,
              color: whiteColor,
            ),
            onPressed: () {
              _launchURL(pdfUrl);
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        // Add any other configuration you need
      ),
    );
  }
}
