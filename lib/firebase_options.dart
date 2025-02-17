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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBT8_rKGeqkoRTgbgy5tUvBEmTn4Hm7vvU',
    appId: '1:543538358996:web:cf9b98f880dfc4ecdb2941',
    messagingSenderId: '543538358996',
    projectId: 'servicify-a4218',
    authDomain: 'servicify-a4218.firebaseapp.com',
    storageBucket: 'servicify-a4218.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDejb61qhD_AJybwyGxO3KZB3alZEJPVe4',
    appId: '1:543538358996:android:e1a5ac615f766c53db2941',
    messagingSenderId: '543538358996',
    projectId: 'servicify-a4218',
    storageBucket: 'servicify-a4218.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDp4Cd-zrPRoY2qN1LMimfdiDxAKvpEyWE',
    appId: '1:543538358996:ios:a9d9147bc942096edb2941',
    messagingSenderId: '543538358996',
    projectId: 'servicify-a4218',
    storageBucket: 'servicify-a4218.appspot.com',
    iosBundleId: 'com.ralfiz.servicify',
  );
}
