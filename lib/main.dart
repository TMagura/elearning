import 'package:elearning/common/utils/app_styles.dart';
import 'package:elearning/common/routes/routes.dart';
import 'package:elearning/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
 await Global.init();
  // if you are using Riverpod always wrap the main root with the ProviderScope widget
  runApp(const ProviderScope(child:MyApp()),);
}
//navigation will be done and it will have the ref object that allow us to use context without passing it around 
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
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

