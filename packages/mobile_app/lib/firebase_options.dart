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
    apiKey: 'AIzaSyDr0LoHy10KuNTniCE1CjJVJUjSGxL7Zko',
    appId: '1:1031466051666:android:99c57c6e5a0f21d42f578b',
    messagingSenderId: '1031466051666',
    projectId: 'prophet-app',
    databaseURL: 'https://prophet-app.firebaseio.com',
    storageBucket: 'prophet-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU4orB6S0CkH-QR9uOKYjia_XTtWf443A',
    appId: '1:1031466051666:ios:471d705ddb4d1d7a2f578b',
    messagingSenderId: '1031466051666',
    projectId: 'prophet-app',
    databaseURL: 'https://prophet-app.firebaseio.com',
    storageBucket: 'prophet-app.appspot.com',
    androidClientId: '1031466051666-led253chka8uubciqpqkk27b8sq8bhqs.apps.googleusercontent.com',
    iosClientId: '1031466051666-nmpfvsfdj636qbuqn67hrdft5s572hur.apps.googleusercontent.com',
    iosBundleId: 'app.myprophet',
  );
}
