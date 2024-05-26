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
    apiKey: 'AIzaSyCseqFoMcn4TbJM1U6wiTI31bjsTFncubs',
    appId: '1:255866899154:web:a76e11f12bbda193c47b0b',
    messagingSenderId: '255866899154',
    projectId: 'todoapp-d0a50',
    authDomain: 'todoapp-d0a50.firebaseapp.com',
    storageBucket: 'todoapp-d0a50.appspot.com',
    measurementId: 'G-WHW6V4216C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoSp52_Ft3wF18T7HKVggJACSKKxJo8bE',
    appId: '1:255866899154:android:536c1bf16a13ef54c47b0b',
    messagingSenderId: '255866899154',
    projectId: 'todoapp-d0a50',
    storageBucket: 'todoapp-d0a50.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhrIvkG5cmvAoNQEbEbdJV7Xe2tQuU3Dg',
    appId: '1:255866899154:ios:15154dc12fc48227c47b0b',
    messagingSenderId: '255866899154',
    projectId: 'todoapp-d0a50',
    storageBucket: 'todoapp-d0a50.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhrIvkG5cmvAoNQEbEbdJV7Xe2tQuU3Dg',
    appId: '1:255866899154:ios:15154dc12fc48227c47b0b',
    messagingSenderId: '255866899154',
    projectId: 'todoapp-d0a50',
    storageBucket: 'todoapp-d0a50.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCseqFoMcn4TbJM1U6wiTI31bjsTFncubs',
    appId: '1:255866899154:web:5377f9e94ecef850c47b0b',
    messagingSenderId: '255866899154',
    projectId: 'todoapp-d0a50',
    authDomain: 'todoapp-d0a50.firebaseapp.com',
    storageBucket: 'todoapp-d0a50.appspot.com',
    measurementId: 'G-96XL2129EL',
  );
}
