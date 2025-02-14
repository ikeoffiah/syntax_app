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
    apiKey: 'AIzaSyC1FL2wWZdYnYRulx5tfnb2tpiPybpcQv0',
    appId: '1:347827090736:web:7d137551ca681ed28f44f5',
    messagingSenderId: '347827090736',
    projectId: 'syntax-535fa',
    authDomain: 'syntax-535fa.firebaseapp.com',
    storageBucket: 'syntax-535fa.firebasestorage.app',
    measurementId: 'G-44GP8NXLXS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzyWI8zOSjQPRWdLs3KDAV2YTMIRLKs-E',
    appId: '1:347827090736:android:dc5c9c3a6b8d95738f44f5',
    messagingSenderId: '347827090736',
    projectId: 'syntax-535fa',
    storageBucket: 'syntax-535fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYvEhWa3NPXOgcXr8eSIw8KfCL4BUamQg',
    appId: '1:347827090736:ios:614d06e80453c4f98f44f5',
    messagingSenderId: '347827090736',
    projectId: 'syntax-535fa',
    storageBucket: 'syntax-535fa.firebasestorage.app',
    iosBundleId: 'co.syntaxapp.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYvEhWa3NPXOgcXr8eSIw8KfCL4BUamQg',
    appId: '1:347827090736:ios:8644b201d26f8ce48f44f5',
    messagingSenderId: '347827090736',
    projectId: 'syntax-535fa',
    storageBucket: 'syntax-535fa.firebasestorage.app',
    iosBundleId: 'com.example.syntaxApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1FL2wWZdYnYRulx5tfnb2tpiPybpcQv0',
    appId: '1:347827090736:web:64cc40400fe7109f8f44f5',
    messagingSenderId: '347827090736',
    projectId: 'syntax-535fa',
    authDomain: 'syntax-535fa.firebaseapp.com',
    storageBucket: 'syntax-535fa.firebasestorage.app',
    measurementId: 'G-NS2RCYNP9J',
  );
}
