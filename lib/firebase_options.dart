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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAdTSDPDXhbmEIwQPYdMe33I_ZPlwPs6JU',
    appId: '1:632488872709:web:a43d7579b505aed8c9856c',
    messagingSenderId: '632488872709',
    projectId: 'newsapp-flutter-27cfc',
    authDomain: 'newsapp-flutter-27cfc.firebaseapp.com',
    storageBucket: 'newsapp-flutter-27cfc.appspot.com',
    measurementId: 'G-3KTE5YDN2Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwfljQwNr2qru6YpeuU_jBZBR96nqdzNU',
    appId: '1:632488872709:android:4a327a4c55ea1e6fc9856c',
    messagingSenderId: '632488872709',
    projectId: 'newsapp-flutter-27cfc',
    storageBucket: 'newsapp-flutter-27cfc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvsmoNonYFO9PHHSIV5Wh2au78WLJUmDc',
    appId: '1:632488872709:ios:679e618b697719d8c9856c',
    messagingSenderId: '632488872709',
    projectId: 'newsapp-flutter-27cfc',
    storageBucket: 'newsapp-flutter-27cfc.appspot.com',
    iosBundleId: 'com.example.googleLogin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdTSDPDXhbmEIwQPYdMe33I_ZPlwPs6JU',
    appId: '1:632488872709:web:495a829dba128ccdc9856c',
    messagingSenderId: '632488872709',
    projectId: 'newsapp-flutter-27cfc',
    authDomain: 'newsapp-flutter-27cfc.firebaseapp.com',
    storageBucket: 'newsapp-flutter-27cfc.appspot.com',
    measurementId: 'G-7DMRBTCXJC',
  );
}
