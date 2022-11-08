// ignore_for_file: prefer_const_constructors

import 'package:covert_html_to_pdf/AllProductScreen.dart';
import 'package:covert_html_to_pdf/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'html_to_pdf.dart';

Future<void> main() async {
  await DioHelper.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const html_to_pdf(),
      home: const AllProductScreen(),
    );
  }
}
