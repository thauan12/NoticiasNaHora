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
    apiKey: 'AIzaSyASb9lxBvJhY3rOdvooOV4NiNNnFc7YV54',
    appId: '1:603856732437:web:d5d3f41ccf313a69dfa91c',
    messagingSenderId: '603856732437',
    projectId: 'noticiasnahora-1dcee',
    authDomain: 'noticiasnahora-1dcee.firebaseapp.com',
    storageBucket: 'noticiasnahora-1dcee.appspot.com',
    measurementId: 'G-SQ0Z6R3J2G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdIQzM8UEl2zZjyBdqY1lSSpMYwjDtPJw',
    appId: '1:603856732437:android:2b14af1436c1727fdfa91c',
    messagingSenderId: '603856732437',
    projectId: 'noticiasnahora-1dcee',
    storageBucket: 'noticiasnahora-1dcee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkJC7sbE2S7C1iXcobWkWRBM1b9OPFGEE',
    appId: '1:603856732437:ios:9bbcb268c553a6a9dfa91c',
    messagingSenderId: '603856732437',
    projectId: 'noticiasnahora-1dcee',
    storageBucket: 'noticiasnahora-1dcee.appspot.com',
    iosClientId: '603856732437-12qvpdb5mm4jq96r3gid7skh54vdd99u.apps.googleusercontent.com',
    iosBundleId: 'com.example.noticiasnahora',
  );
}