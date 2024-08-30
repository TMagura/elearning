
import 'package:elearning/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'common/services/storage.dart';

class Global{ //global class will have all the initialisations for the application
  static late StorageService storageService;

  static Future init ()async {
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
   storageService = await StorageService().init();
  }
}


// import 'package:riverpod_annotation/riverpod_annotation.dart';
// flutter pub run build_runner watch --delete-conflicting-outputs
