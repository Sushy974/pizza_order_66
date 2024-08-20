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
    apiKey: 'AIzaSyDd5SAurZig6mVDssmN_HKAeV-fCWBq2Sg',
    appId: '1:589054183786:web:144fafacf2fbf0b03cfd13',
    messagingSenderId: '589054183786',
    projectId: 'pizza-order-66-28205',
    authDomain: 'pizza-order-66-28205.firebaseapp.com',
    storageBucket: 'pizza-order-66-28205.appspot.com',
    measurementId: 'G-PVN0K7Y026',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVsFU92gsStBdKN5HkzDzi4Esg35RVyKo',
    appId: '1:589054183786:android:30cb59180e66744a3cfd13',
    messagingSenderId: '589054183786',
    projectId: 'pizza-order-66-28205',
    storageBucket: 'pizza-order-66-28205.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHusp1hb6K-ZwHF3B7WatgPxAU0wOcpoo',
    appId: '1:589054183786:ios:fb8f02a239038fba3cfd13',
    messagingSenderId: '589054183786',
    projectId: 'pizza-order-66-28205',
    storageBucket: 'pizza-order-66-28205.appspot.com',
    iosBundleId: 'com.example.verygoodcore.pizza-order-66',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHusp1hb6K-ZwHF3B7WatgPxAU0wOcpoo',
    appId: '1:589054183786:ios:431c673be8506efc3cfd13',
    messagingSenderId: '589054183786',
    projectId: 'pizza-order-66-28205',
    storageBucket: 'pizza-order-66-28205.appspot.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDd5SAurZig6mVDssmN_HKAeV-fCWBq2Sg',
    appId: '1:589054183786:web:e33e458636f88b913cfd13',
    messagingSenderId: '589054183786',
    projectId: 'pizza-order-66-28205',
    authDomain: 'pizza-order-66-28205.firebaseapp.com',
    storageBucket: 'pizza-order-66-28205.appspot.com',
    measurementId: 'G-ED1FJT3JPE',
  );
}
