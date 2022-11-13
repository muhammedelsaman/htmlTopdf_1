// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/remote/dio_helper.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String _email= '';
  String _password= '';

  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Post Data'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    //controller: emailController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'email address must not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _email=value??'';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    //controller: passwordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _password=value??'';
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()){
                          formKey.currentState?.save();
                          Response r = await DioHelper.postData(
                            url: 'login',
                            data: {
                              'email': _email,
                              'password': _password,
                            },
                          );
                          debugPrint(r.data['message']);
                            Fluttertoast.showToast(
                                msg: r.data['message']!,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
