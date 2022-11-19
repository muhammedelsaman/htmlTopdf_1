import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 400.0,
          height: 300.0,
          child: const Center(
            child: Text(
              'Next Page',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
