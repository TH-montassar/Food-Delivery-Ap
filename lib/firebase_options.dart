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
    apiKey: 'AIzaSyBI5khD-R3JWlxh-O33AHUM48wbtfyZljI',
    appId: '1:12117261560:web:251ea3ac285ea065a70f0d',
    messagingSenderId: '12117261560',
    projectId: 'foodappflutter-ae888',
    authDomain: 'foodappflutter-ae888.firebaseapp.com',
    databaseURL: 'https://foodappflutter-ae888-default-rtdb.firebaseio.com',
    storageBucket: 'foodappflutter-ae888.firebasestorage.app',
    measurementId: 'G-H1T833TFZN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQ7nMb52BFZMH7z_TSgC8WIWESBypAcPk',
    appId: '1:12117261560:android:0601f081f8bf970ba70f0d',
    messagingSenderId: '12117261560',
    projectId: 'foodappflutter-ae888',
    databaseURL: 'https://foodappflutter-ae888-default-rtdb.firebaseio.com',
    storageBucket: 'foodappflutter-ae888.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOIfrfpPHH8dSzB9FGUAUg3Rz3otmwV-U',
    appId: '1:12117261560:ios:858695f09dc05227a70f0d',
    messagingSenderId: '12117261560',
    projectId: 'foodappflutter-ae888',
    databaseURL: 'https://foodappflutter-ae888-default-rtdb.firebaseio.com',
    storageBucket: 'foodappflutter-ae888.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOIfrfpPHH8dSzB9FGUAUg3Rz3otmwV-U',
    appId: '1:12117261560:ios:858695f09dc05227a70f0d',
    messagingSenderId: '12117261560',
    projectId: 'foodappflutter-ae888',
    databaseURL: 'https://foodappflutter-ae888-default-rtdb.firebaseio.com',
    storageBucket: 'foodappflutter-ae888.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBI5khD-R3JWlxh-O33AHUM48wbtfyZljI',
    appId: '1:12117261560:web:a1c43f9eccbaedbfa70f0d',
    messagingSenderId: '12117261560',
    projectId: 'foodappflutter-ae888',
    authDomain: 'foodappflutter-ae888.firebaseapp.com',
    databaseURL: 'https://foodappflutter-ae888-default-rtdb.firebaseio.com',
    storageBucket: 'foodappflutter-ae888.firebasestorage.app',
    measurementId: 'G-1E80W0BH72',
  );
}
