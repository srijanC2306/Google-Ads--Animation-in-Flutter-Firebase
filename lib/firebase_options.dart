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
    apiKey: 'AIzaSyCFfSntnt5dW2A6Gvy5-3bZRrxch29bMU4',
    appId: '1:847226598993:web:a025974e76d39c84392a70',
    messagingSenderId: '847226598993',
    projectId: 'ads-267eb',
    authDomain: 'ads-267eb.firebaseapp.com',
    storageBucket: 'ads-267eb.appspot.com',
    measurementId: 'G-00GX7JSWR4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxzW5_HrqnJeDfgg8UoKhttWwAXa4YD2w',
    appId: '1:847226598993:android:8753679cda821f74392a70',
    messagingSenderId: '847226598993',
    projectId: 'ads-267eb',
    storageBucket: 'ads-267eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcNv5AN5TIO3yOmbmO96Y5GvehiSzPam8',
    appId: '1:847226598993:ios:1b128f33777891c6392a70',
    messagingSenderId: '847226598993',
    projectId: 'ads-267eb',
    storageBucket: 'ads-267eb.appspot.com',
    iosBundleId: 'com.example.googleAdsMobIntegration',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcNv5AN5TIO3yOmbmO96Y5GvehiSzPam8',
    appId: '1:847226598993:ios:1b128f33777891c6392a70',
    messagingSenderId: '847226598993',
    projectId: 'ads-267eb',
    storageBucket: 'ads-267eb.appspot.com',
    iosBundleId: 'com.example.googleAdsMobIntegration',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCFfSntnt5dW2A6Gvy5-3bZRrxch29bMU4',
    appId: '1:847226598993:web:30448775a8d99da6392a70',
    messagingSenderId: '847226598993',
    projectId: 'ads-267eb',
    authDomain: 'ads-267eb.firebaseapp.com',
    storageBucket: 'ads-267eb.appspot.com',
    measurementId: 'G-44B1TFNLEM',
  );
}
