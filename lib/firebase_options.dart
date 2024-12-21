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
    apiKey: 'AIzaSyC6_XIlBXQXIKCHrYhYcS_Ohww5hms_Pds',
    appId: '1:777007553531:android:194a0763ca256833d7c95e',
    messagingSenderId: '777007553531',
    projectId: 'fruit-hub-9482d',
    storageBucket: 'fruit-hub-9482d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyButnHX4xlJetyOczf8SvhhUfUjAxQpTwE',
    appId: '1:777007553531:ios:888f51fb3bcdef00d7c95e',
    messagingSenderId: '777007553531',
    projectId: 'fruit-hub-9482d',
    storageBucket: 'fruit-hub-9482d.firebasestorage.app',
    androidClientId: '777007553531-288vm68li2qirl7eohira4ostah941t9.apps.googleusercontent.com',
    iosClientId: '777007553531-c28966u98a07m5f9cdqopsk48ip1duva.apps.googleusercontent.com',
    iosBundleId: 'com.fruitdashboard.fruitDashboard',
  );
}
