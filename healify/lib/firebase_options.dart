// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBBmdYwtbeIq0AOSQVUL88ty2GfwvJb7Q8',
    appId: '1:956424255593:web:4bdd6f4ec836ad71470af8',
    messagingSenderId: '956424255593',
    projectId: 'healify-b433f',
    authDomain: 'healify-b433f.firebaseapp.com',
    storageBucket: 'healify-b433f.appspot.com',
    measurementId: 'G-NL8S6SJRGV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJAGJen33y3f9GmiEO_OUqcQrpPsNzKKA',
    appId: '1:956424255593:android:f5bc11ccc06c0e0f470af8',
    messagingSenderId: '956424255593',
    projectId: 'healify-b433f',
    storageBucket: 'healify-b433f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUh0nSInHZ2v_ZBnXLwkIKJRNGVMEzAMM',
    appId: '1:956424255593:ios:aea3f76824e82d92470af8',
    messagingSenderId: '956424255593',
    projectId: 'healify-b433f',
    storageBucket: 'healify-b433f.appspot.com',
    androidClientId: '956424255593-11nu8ri6ot8bq7230o2ge8q7vtakegrk.apps.googleusercontent.com',
    iosClientId: '956424255593-8kk6108dp7no09cpeb0amkc61fl488jp.apps.googleusercontent.com',
    iosBundleId: 'com.example.healify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUh0nSInHZ2v_ZBnXLwkIKJRNGVMEzAMM',
    appId: '1:956424255593:ios:aea3f76824e82d92470af8',
    messagingSenderId: '956424255593',
    projectId: 'healify-b433f',
    storageBucket: 'healify-b433f.appspot.com',
    androidClientId: '956424255593-11nu8ri6ot8bq7230o2ge8q7vtakegrk.apps.googleusercontent.com',
    iosClientId: '956424255593-8kk6108dp7no09cpeb0amkc61fl488jp.apps.googleusercontent.com',
    iosBundleId: 'com.example.healify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBmdYwtbeIq0AOSQVUL88ty2GfwvJb7Q8',
    appId: '1:956424255593:web:d44d5bddbe6d9d62470af8',
    messagingSenderId: '956424255593',
    projectId: 'healify-b433f',
    authDomain: 'healify-b433f.firebaseapp.com',
    storageBucket: 'healify-b433f.appspot.com',
    measurementId: 'G-3EM0TQM6KK',
  );
}
