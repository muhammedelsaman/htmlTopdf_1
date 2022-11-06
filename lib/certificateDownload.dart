// ignore_for_file: no_logic_in_create_state, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

import 'html_to_pdf.dart';

class CertificateDownload extends StatefulWidget {
  const CertificateDownload(
      {Key? key, required this.certificateData, required this.certificatePath})
      : super(key: key);
  final String certificateData;
  final String certificatePath;

  @override
  State<CertificateDownload> createState() =>
      _CertificateDownloadState(certificateData, certificatePath);
}

class _CertificateDownloadState extends State<CertificateDownload> {
  _CertificateDownloadState(this.cfData, this.cfPath);
  late String cfData;
  late String cfPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("Certificate"),
        ),
        body: SfPdfViewer.file(pdfFile()));
  }

  void makeRequest() async {
    var response =
        await http.get(Uri.parse('https://speiseplan.app.itelligence.org/'));
    //If the http request is successful the statusCode will be 200
    if (response.statusCode == 200) {
      String htmlToParse = response.body;
      print(htmlToParse);
    }
  }

  File pdfFile() {
    if (Platform.isIOS) {
      return File(cfPath + "/" + cfData + '.pdf'); // for ios
    } else {
      print("aaaaa " + cfPath);
      // File('storage/emulated/0/Download/' + cfData + '.pdf');
      return File(cfPath + "/" + cfData + '.pdf'); // for android
    }
  }
}
