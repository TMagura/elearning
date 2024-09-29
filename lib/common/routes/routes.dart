// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elearning/common/routes/app_routes_names.dart';
import 'package:elearning/global.dart';
import 'package:elearning/pages/Sign_up/sign_up.dart';
import 'package:elearning/pages/application/application.dart';
import 'package:elearning/pages/course_detail/view/course_detail.dart';
import 'package:elearning/pages/home/view/home.dart';
import 'package:elearning/pages/lesson_detail/view/lesson_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:elearning/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.SIGN_UP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
      RouteEntity(path: AppRoutesNames.COURSE_DETAIL, page: const CourseDetail()),
      RouteEntity(path: AppRoutesNames.LESSON_DETAIL, page: const LessonDetail()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path ==settings.name);
      if (result.isNotEmpty) {
        //check if the app is opened for the first time
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

      print(deviceFirstTime);
      if (result.first.path ==AppRoutesNames.WELCOME&&deviceFirstTime) {
        bool isLoggedIn = Global.storageService.isLoggedIn();
        if (isLoggedIn) {
          return MaterialPageRoute(
          builder: (_) =>const  Application(),
          settings: settings);
        }else{
          return MaterialPageRoute(
        builder: (_) =>const  SignIn(),
        settings: settings);
        }
      }else{
        if (kDebugMode) {
          print("App running for the first time");
        }
        return MaterialPageRoute(
        builder: (_) => result.first.page,
        settings: settings);
      }
      }
    }
    return MaterialPageRoute(
        builder: (_) => Welcome(),
        settings: settings);
  }

}
//Create an object that will be used to create more routes in a list 
class RouteEntity {
  String path;
  Widget page;
  RouteEntity({
    required this.path,
    required this.page,
  });

}
