// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///flutter pub add firebase_core
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXr-uf2-DRgpTJhqxlbFr1_MUlRBfXf9g',
    appId: '1:962396868145:android:8eb54f5138a93ec77d0f10',
    messagingSenderId: '962396868145',
    projectId: 'cvflutter-c2fcc',
    databaseURL:
        'https://cvflutter-c2fcc-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cvflutter-c2fcc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBw7xMLRdjANj2T3vsH2j3bIFiNiqyIF04',
    appId: '1:962396868145:ios:a59546f513312c6d7d0f10',
    messagingSenderId: '962396868145',
    projectId: 'cvflutter-c2fcc',
    databaseURL:
        'https://cvflutter-c2fcc-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'cvflutter-c2fcc.appspot.com',
    iosClientId:
        '962396868145-16prm81pbu3rrlpifjl3ose13aj7hscu.apps.googleusercontent.com',
    iosBundleId: 'com.example.cvflutter',
  );
}
