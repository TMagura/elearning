import 'dart:convert';

import 'package:elearning/common/model/user.dart';
import 'package:elearning/common/global_loader/global_loader.dart';
import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/widgets/popup_messages.dart';
import 'package:elearning/global.dart';
import 'package:elearning/main.dart';
import 'package:elearning/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:elearning/pages/sign_in/repo/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController {
  // WidgetRef ref;
  SignInController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailcontroller.text = email;
    passwordController.text = password;

    print("email is $email");
    print("password is $password");

    //Login validation
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Please enter your email");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Please enter your password");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("User is not found");
      }
      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email first");
      }
      var user = credential.user;
      if (user != null) {
        //these can be one object so convert it and create a model
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);

        print("user logged in");
      } else {
        toastInfo("login Error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toastInfo("User does not exist");
      } else if (e.code == "invalid-credential") {
        toastInfo("username and password do not match");
      } else if (e.code == "wrong-password") {
        toastInfo("Your entered a wrong pawword");
      } else if (e.code == "network-request-failed"){
         toastInfo("No internet connection");
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    //saving data we must talk to server

    //save data in local storage (use shared_preferences)
    try {
      // var navigator = Navigator.of(ref.context);
      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode({
            'name':"Tee", 'email':'a@mailinator.com','age':27
          }));
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
      //redirect to another page
      navKey.currentState?.pushNamedAndRemoveUntil("application",(route)=>false);
      
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //redirect to new page
  }
}
