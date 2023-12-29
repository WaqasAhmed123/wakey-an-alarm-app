// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAKYYZR-QLase1rWMDjaDpfbGKWDacCk7Q',
    appId: '1:128894295889:web:324e8fa8ac73564ccabd70',
    messagingSenderId: '128894295889',
    projectId: 'wakey00',
    authDomain: 'wakey00.firebaseapp.com',
    storageBucket: 'wakey00.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbaQyqm1PAPViGKgAIldZpkrrmojleGfc',
    appId: '1:128894295889:android:b42cbeda0a509c10cabd70',
    messagingSenderId: '128894295889',
    projectId: 'wakey00',
    storageBucket: 'wakey00.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtAv433Qcv01S9gpUbG5NFYF6cWwgZGNg',
    appId: '1:128894295889:ios:b2fd8e8cb321a25bcabd70',
    messagingSenderId: '128894295889',
    projectId: 'wakey00',
    storageBucket: 'wakey00.appspot.com',
    iosBundleId: 'com.example.wakey',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtAv433Qcv01S9gpUbG5NFYF6cWwgZGNg',
    appId: '1:128894295889:ios:e7f2fed19ea53ebfcabd70',
    messagingSenderId: '128894295889',
    projectId: 'wakey00',
    storageBucket: 'wakey00.appspot.com',
    iosBundleId: 'com.example.wakey.RunnerTests',
  );
}
