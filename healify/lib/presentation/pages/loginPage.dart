// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:healify/domain_layer/providers/authProvider.dart';
import 'package:healify/domain_layer/routes/routename.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  _handleGoogleSignIn(context);
                  Navigator.pushNamed(context, Routename.home);
                },
                
                child: const Text('Sign in with Google'),
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    final loginNotifier = LoginNotifier();
    try {
      await loginNotifier.signInWithGoogle();
    
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during sign in: ${e.toString()}')),
      );
    }
  }

  Future<void> _handleSignOut(BuildContext context) async {
    final loginNotifier = LoginNotifier();
    try {
      await loginNotifier.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during sign out: ${e.toString()}')),
      );
    }
  }
}
