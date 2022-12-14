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
    apiKey: 'AIzaSyDpap6-WtqHwD9Hh92psPR10CnH0iYJWG0',
    appId: '1:68834890530:web:e0fd42caf332521b938b7b',
    messagingSenderId: '68834890530',
    projectId: 'goal-tracker-97e67',
    authDomain: 'goal-tracker-97e67.firebaseapp.com',
    storageBucket: 'goal-tracker-97e67.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUcZMQb-9r7RiIscPQbL1IAV0tckqeqIQ',
    appId: '1:68834890530:android:02ccaa01578fa147938b7b',
    messagingSenderId: '68834890530',
    projectId: 'goal-tracker-97e67',
    storageBucket: 'goal-tracker-97e67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgFTqEm4NpvvtueLybjREsN_tL_FSCzR4',
    appId: '1:68834890530:ios:a9950773c5124e27938b7b',
    messagingSenderId: '68834890530',
    projectId: 'goal-tracker-97e67',
    storageBucket: 'goal-tracker-97e67.appspot.com',
    iosClientId: '68834890530-je9pa5ht53aarfvmfuulnct4l77osgem.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterGoalTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgFTqEm4NpvvtueLybjREsN_tL_FSCzR4',
    appId: '1:68834890530:ios:a9950773c5124e27938b7b',
    messagingSenderId: '68834890530',
    projectId: 'goal-tracker-97e67',
    storageBucket: 'goal-tracker-97e67.appspot.com',
    iosClientId: '68834890530-je9pa5ht53aarfvmfuulnct4l77osgem.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterGoalTracker',
  );
}
