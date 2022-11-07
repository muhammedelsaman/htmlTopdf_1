// ignore_for_file: prefer_collection_literals, use_build_context_synchronously, avoid_print, unused_catch_stack, deprecated_member_use, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:io';

import 'package:covert_html_to_pdf/certificateDownload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
// Reference to webview controller
  late WebViewController _controller;
  late String cfData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web View Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400.0,
              height: 600.0,
              child: WebView(
                initialUrl: 'https://yourwebsite.com',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  // Get reference to WebView controller to access it globally
                  _controller = webViewController;
                },
                javascriptChannels: <JavascriptChannel>[
                  // Set Javascript Channel to WebView
                  _extractDataJSChannel(context),
                ].toSet(),
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                  // In the final result page we check the url to make sure  it is the last page.
                  _controller.evaluateJavascript(
                      "(function(){Flutter.postMessage(window.document.body.outerHTML)})();");
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await convert(cfData, "File Name");
                var targetPath2 =
                    await _localPath; //  file store path is required for open the file and send to the next screen

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CertificateDownload(
                        certificateData: "File Name",
                        certificatePath: targetPath2
                            .toString(), // File name is that name that was open in next screen
                      ),
                    ));
              },
              child: const Text("Html_to_pdf"),
            ),
          ],
        ),
      ),
    );
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        cfData = message.message;
        print(cfData);
        // print('page body: $pageBody');
        //log(pageBody);
      },
    );
  }

  Future convert(String cfData, String name) async {
    // Name is File Name that you want to give the file
    var targetPath = await _localPath;
    var targetFileName = name;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        cfData, targetPath!, targetFileName);
    print(generatedPdfFile);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(generatedPdfFile.toString()),
    ));
  }

  Future<String?> get _localPath async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationSupportDirectory();
        print(directory.path);
      } else {
        // if platform is android
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      print("Can-not get download folder path");
    }
    return directory?.path;
  }
}
