// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginNotifier extends ChangeNotifier {
   User? _currentUser;

  User? get currentUser => _currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
     
      if (googleUser == null) {
        throw Exception("Google Sign In was cancelled");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      _currentUser = userCredential.user;
      notifyListeners();
      return userCredential;
    } catch (e) {
      print("Error during Google Sign In: ${e.toString()}");
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      notifyListeners();
      _currentUser = null;
      return true;
    } catch (e) {
      print("Error during sign out: ${e.toString()}");
      return false;
    }
  }
}
