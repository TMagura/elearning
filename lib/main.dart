import 'package:elearning/common/utils/app_styles.dart';
import 'package:elearning/common/utils/routes/routes.dart';
import 'package:elearning/global.dart';
import 'package:elearning/pages/Sign_up/sign_up.dart';
import 'package:elearning/pages/application/application.dart';
import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:elearning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
 await Global.init();
  // if you are using Riverpod always wrap the main root with the ProviderScope widget
  runApp(const ProviderScope(child:MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elearning',
      theme: AppTheme.appThemeData,
      initialRoute: "/", //this will be the initial route define it in routes map
      //create a map of routes in the form "name":(context)=> PageName()" 
      onGenerateRoute: (settings)=>AppPages.generateRouteSettings(settings),
      // routes: {
      //   "/":(context)=> Welcome(),
      //   "signIn":(context) => const SignIn(),
      //   "register":(context) => const SignUp(),
      //   "application":(context) => const Application(),
      // },
    );
  }
}

