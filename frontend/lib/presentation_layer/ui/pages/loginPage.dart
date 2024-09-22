import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        automaticallyImplyLeading: false,
      ),
     body: const Center(
       child: Text('Login Page'),
     ),
    );
  }
}