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
    apiKey: 'AIzaSyAZomaQxI9Dj7kj3xyqEPm3sJ7fQGI20Q0',
    appId: '1:215214654783:web:3889252eedbfff549cff8a',
    messagingSenderId: '215214654783',
    projectId: 'fir-labr',
    authDomain: 'fir-labr.firebaseapp.com',
    storageBucket: 'fir-labr.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl70mEMTtppozRKChyiWMSniGbWuY55Lc',
    appId: '1:215214654783:android:5108300d69bbe01e9cff8a',
    messagingSenderId: '215214654783',
    projectId: 'fir-labr',
    storageBucket: 'fir-labr.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtFLa6bzHUztOM9mbql4IsBYkX_Yc5ED0',
    appId: '1:215214654783:ios:f498661fe1d0f2e79cff8a',
    messagingSenderId: '215214654783',
    projectId: 'fir-labr',
    storageBucket: 'fir-labr.appspot.com',
    iosBundleId: 'com.example.firebaseLabr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtFLa6bzHUztOM9mbql4IsBYkX_Yc5ED0',
    appId: '1:215214654783:ios:f498661fe1d0f2e79cff8a',
    messagingSenderId: '215214654783',
    projectId: 'fir-labr',
    storageBucket: 'fir-labr.appspot.com',
    iosBundleId: 'com.example.firebaseLabr',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZomaQxI9Dj7kj3xyqEPm3sJ7fQGI20Q0',
    appId: '1:215214654783:web:0c60cdcd4fe80cc79cff8a',
    messagingSenderId: '215214654783',
    projectId: 'fir-labr',
    authDomain: 'fir-labr.firebaseapp.com',
    storageBucket: 'fir-labr.appspot.com',
  );
}
