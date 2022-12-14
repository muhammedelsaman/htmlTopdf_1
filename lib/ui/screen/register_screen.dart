import 'package:covert_html_to_pdf/blocs/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
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
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      _name = value ?? '';
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      _email = value ?? '';
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email address must not be empty';
                      }
                      return null;
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
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
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
                  TextFormField(
                    onSaved: (value) {
                      _phone = value ?? '';
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Consumer(
                      builder: (_, ref, __) {
                        return MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState?.save();
                              ref.read(AuthNotifier.provider.notifier).register(
                                  name: _name,
                                  email: _email,
                                  password: _password,
                                  phone: _phone,
                              );
                            }
                          },
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
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
