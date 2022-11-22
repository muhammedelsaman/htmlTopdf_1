import 'package:covert_html_to_pdf/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


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
          home: const SplashScreen(),
        // home:   Consumer(builder: (_,ref,__){
        //   final state = ref.read(LoginNotifier.provider);
        //   print(state);
        //   return state is LoginSuccess ? const HomeScreen():const LoginScreen();
        // },),
      ),
    );
  }
}
