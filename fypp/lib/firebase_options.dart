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
    apiKey: 'AIzaSyCGvWz2KFfKAUcwcCvaVZic9jp1HNgCxiI',
    appId: '1:971331782820:web:f438f13d674a3ae1e17e31',
    messagingSenderId: '971331782820',
    projectId: 'therapy-ai-d561f',
    authDomain: 'therapy-ai-d561f.firebaseapp.com',
    databaseURL: 'https://therapy-ai-d561f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'therapy-ai-d561f.appspot.com',
    measurementId: 'G-8GH6PTB3Z8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBemTRc0PHlx_Xl8X34TQi9s9iVqhTxP2c',
    appId: '1:971331782820:android:bc737ad9ecadbd69e17e31',
    messagingSenderId: '971331782820',
    projectId: 'therapy-ai-d561f',
    databaseURL: 'https://therapy-ai-d561f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'therapy-ai-d561f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOAUrSpk29iJZ_57gJo9LCEjQVm_4rjcM',
    appId: '1:971331782820:ios:f04745575fbf16a1e17e31',
    messagingSenderId: '971331782820',
    projectId: 'therapy-ai-d561f',
    databaseURL: 'https://therapy-ai-d561f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'therapy-ai-d561f.appspot.com',
    iosClientId: '971331782820-2gi9b58p65illfnps5sg4imgtk4rcijv.apps.googleusercontent.com',
    iosBundleId: 'com.example.fypp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOAUrSpk29iJZ_57gJo9LCEjQVm_4rjcM',
    appId: '1:971331782820:ios:f04745575fbf16a1e17e31',
    messagingSenderId: '971331782820',
    projectId: 'therapy-ai-d561f',
    databaseURL: 'https://therapy-ai-d561f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'therapy-ai-d561f.appspot.com',
    iosClientId: '971331782820-2gi9b58p65illfnps5sg4imgtk4rcijv.apps.googleusercontent.com',
    iosBundleId: 'com.example.fypp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGvWz2KFfKAUcwcCvaVZic9jp1HNgCxiI',
    appId: '1:971331782820:web:60b8ffa671e46653e17e31',
    messagingSenderId: '971331782820',
    projectId: 'therapy-ai-d561f',
    authDomain: 'therapy-ai-d561f.firebaseapp.com',
    databaseURL: 'https://therapy-ai-d561f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'therapy-ai-d561f.appspot.com',
    measurementId: 'G-6RV2DP72ML',
  );

}