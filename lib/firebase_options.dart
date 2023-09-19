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
    apiKey: 'AIzaSyDuOs39BroJhGXts-U3zPR2hHmBIsPm7A8',
    appId: '1:995266014619:web:77efa7e832cb75b6fa453e',
    messagingSenderId: '995266014619',
    projectId: 'chat-app-flutter-app',
    authDomain: 'chat-app-flutter-app.firebaseapp.com',
    storageBucket: 'chat-app-flutter-app.appspot.com',
    measurementId: 'G-SGRS57LFT3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfCMTkF9r3q3hlEt68cgkIW9iUbQKKMjE',
    appId: '1:995266014619:android:a16aa28e067e54befa453e',
    messagingSenderId: '995266014619',
    projectId: 'chat-app-flutter-app',
    storageBucket: 'chat-app-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3uohhSRJcIWEO2qhjR93ZIrLfxLpJTKU',
    appId: '1:995266014619:ios:47ef2bc52046bd31fa453e',
    messagingSenderId: '995266014619',
    projectId: 'chat-app-flutter-app',
    storageBucket: 'chat-app-flutter-app.appspot.com',
    iosClientId: '995266014619-pjo68ieh7b4dv9tt91oanjovou31uv46.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3uohhSRJcIWEO2qhjR93ZIrLfxLpJTKU',
    appId: '1:995266014619:ios:e6f6a1029e1bca42fa453e',
    messagingSenderId: '995266014619',
    projectId: 'chat-app-flutter-app',
    storageBucket: 'chat-app-flutter-app.appspot.com',
    iosClientId: '995266014619-ujetkgn986j0annj8ack735vpk5hva62.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppFlutterApp.RunnerTests',
  );
}
