import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../blocs/providers/auth_notifier.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 400.0,
                    width: 300.0,
                    color: Colors.blue,
                    child:  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Next Page',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Consumer(

                      builder: (_, ref,__) {
                        return MaterialButton(
                          onPressed: () async {
                            formKey.currentState?.save();
                            ref.read(AuthNotifier.provider.notifier).logout();
                            Navigator.pushAndRemoveUntil(context,
                             MaterialPageRoute(builder: (context) => const LoginScreen()),
                             (route) => false);
                          },
                          child: const Text(
                            'LOGOUT',
                            style: TextStyle(color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


