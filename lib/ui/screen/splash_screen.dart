// ignore_for_file: avoid_print

import 'dart:async';

import 'package:covert_html_to_pdf/blocs/providers/auth_notifier.dart';
import 'package:covert_html_to_pdf/blocs/providers/chache_repositorylayer.dart';
import 'package:covert_html_to_pdf/ui/screen/home_screen.dart';
import 'package:covert_html_to_pdf/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(LocalStorge.provider).init();
    Future.delayed(const Duration(seconds: 2), () {
      final loginNotifier = ref.watch(AuthNotifier.provider.notifier);
      loginNotifier.check();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginStates>(AuthNotifier.provider, (prev, next) {
      if (next is LoginSuccess) {
     print(next.loginModel.toJson());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else if (next is LoginNotLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
    return SizedBox.expand(
      child: Container(
        width: 400,
        height: 300,
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/images/mm.jpeg',
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
