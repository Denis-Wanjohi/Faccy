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
    apiKey: 'AIzaSyB-aO3j-RQkDAI3eqTe46Tk8EMfMoHy4Wk',
    appId: '1:28137564212:web:a77e2d922517843e0c8261',
    messagingSenderId: '28137564212',
    projectId: 'faccy-app',
    authDomain: 'faccy-app.firebaseapp.com',
    storageBucket: 'faccy-app.firebasestorage.app',
    measurementId: 'G-CZXLBLLKDP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIi7YBW-kJ47vR0VO8pWc7JWFoRxCJiG0',
    appId: '1:28137564212:android:a5774a8ed782e4c10c8261',
    messagingSenderId: '28137564212',
    projectId: 'faccy-app',
    storageBucket: 'faccy-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqfOYq_nBpI_wFbUp0YqXUSMftUILVbKI',
    appId: '1:28137564212:ios:1b562c49455adb490c8261',
    messagingSenderId: '28137564212',
    projectId: 'faccy-app',
    storageBucket: 'faccy-app.firebasestorage.app',
    iosBundleId: 'com.example.faccy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqfOYq_nBpI_wFbUp0YqXUSMftUILVbKI',
    appId: '1:28137564212:ios:1b562c49455adb490c8261',
    messagingSenderId: '28137564212',
    projectId: 'faccy-app',
    storageBucket: 'faccy-app.firebasestorage.app',
    iosBundleId: 'com.example.faccy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-aO3j-RQkDAI3eqTe46Tk8EMfMoHy4Wk',
    appId: '1:28137564212:web:97d37532ba17e14b0c8261',
    messagingSenderId: '28137564212',
    projectId: 'faccy-app',
    authDomain: 'faccy-app.firebaseapp.com',
    storageBucket: 'faccy-app.firebasestorage.app',
    measurementId: 'G-KTS0W5BBLV',
  );
}
