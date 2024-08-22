import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions{
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnimplementedError(
        "Default firebase options have not been configured for web"
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
       case TargetPlatform.iOS:
        return ios;
        case TargetPlatform.macOS:
        throw UnsupportedError(
          "Default firebase options have not been configured for macOS"
        );
        case TargetPlatform.windows:
        throw UnsupportedError(
          "Default firebase options have not been configured for windows"
        );
        case TargetPlatform.linux:
        throw UnsupportedError(
          "Default firebase options have not been configured for linux"
        );
        default:
        throw UnsupportedError(
          "Default firebase options have not been configured this platform"
        );
    }
  }
}

const FirebaseOptions android = FirebaseOptions(
  apiKey: "AIzaSyDsqskdj3fuhI_SspXt9iOH9Yiq-Js2tHc", 
  appId: "1:299940733969:android:afca13c55ad3a9f1c4fdb0", 
  messagingSenderId: "299940733969", 
  projectId: "elearning-1d29b",
  storageBucket: "elearning-1d29b.appspot.com",
  );

const FirebaseOptions ios = FirebaseOptions(
  apiKey: "AIzaSyDsqskdj3fuhI_SspXt9iOH9Yiq-Js2tHc", 
  appId: "1:299940733969:android:afca13c55ad3a9f1c4fdb0", 
  messagingSenderId: "299940733969", 
  projectId: "elearning-1d29b",
  storageBucket: "elearning-1d29b.appspot.com",
  );