import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
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
    apiKey: 'AIzaSyBLa6k7IFBtKU4P1D4vVygBc_-DkYPd9PE',
    appId: '1:950374009589:android:229498e5c182ba02dfd3bc',
    messagingSenderId: '950374009589',
    projectId: 'permissions-app-5b16e',
    storageBucket: 'permissions-app-5b16e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_0M52DmuHNR9ZZxW7vph5M5i7uBroDAw',
    appId: '1:950374009589:ios:fdfa57cc95772725dfd3bc',
    messagingSenderId: '950374009589',
    projectId: 'permissions-app-5b16e',
    storageBucket: 'permissions-app-5b16e.firebasestorage.app',
    iosBundleId: 'com.example.permissionsApp',
  );
}
