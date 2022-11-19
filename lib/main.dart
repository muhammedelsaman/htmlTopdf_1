import 'package:covert_html_to_pdf/data/remote/dio_helper.dart';
import 'package:covert_html_to_pdf/ui/screen/home_screen.dart';
import 'package:covert_html_to_pdf/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'blocs/providers/chache_repositorylayer.dart';
import 'data/component/constants.dart';

Future<void> main() async {
  await DioHelper.init();


  // fill token in Constants file
  token = RepositoryLayer.getData(key: "token");

  // to empty token
  //token = '';

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: token == '' ?  LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
