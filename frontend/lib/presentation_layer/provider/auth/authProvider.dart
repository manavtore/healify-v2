import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class loginNotifier extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

 Future<void>  googleSignIn() async {
   
    final supabase = Supabase.instance.client;

     const webClientId = 'my-web.apps.googleusercontent.com';
    const iosClientId = 'my-ios.apps.googleusercontent.com';


    final GoogleSignIn googleSignIn =  GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId
    );

     final googleUser = await googleSignIn.signIn();
     final googeAuth = await googleUser!.authentication;

     final accessToken = googeAuth.accessToken;
     final idToken = googeAuth.idToken;

     if(accessToken == null ){
        throw Exception('Login failed');

     }
     if(idToken == null){
        throw Exception('Login failed');
     }
    _isLogin = true;
    notifyListeners();
    // return supabase.auth.(
    //   provider:OAuthProvider.google,
    //   idToken:idToken,
    //   accessToken:accessToken
    // );
    

  }
   Future<void> googleSignOut() async {
    _isLogin = false;
    notifyListeners();
  }

  
}