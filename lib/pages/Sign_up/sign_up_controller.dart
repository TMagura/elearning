import 'package:elearning/common/utils/global_loader/global_loader.dart';
import 'package:elearning/common/widgets/popup_messages.dart';
import 'package:elearning/pages/Sign_up/notifier/register_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//accessing the ref will allows us to access the state object also
class SignUpController{
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async{
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;
    
    // print("your name is $name");
    // print("your email is $email");
    // print("your password is $password");
    // print("your repassword is $rePassword");
    if(state.userName.isEmpty || name.isEmpty){
      toastInfo("Please enter your name");
      return;
    }
    if(state.email.isEmpty || email.isEmpty){
      toastInfo("Please enter your email");
      return;
    }
    if(state.password.isEmpty || state.rePassword.isEmpty||password.isEmpty||rePassword.isEmpty){
      toastInfo("Please enter your password");
      return;
    }

    // if(state.password.length<6 || state.rePassword.length<6){
    //   toastInfo("Password is too short");
    //   return;
    // }
    if(state.password!=state.rePassword || password!=rePassword){
      toastInfo("Password does not match");
      return;
    }

 //show loading indicator
 ref.read(appLoaderProvider.notifier).setLoaderValue(true);

//to avoid across async gaps use context outside the await function
 var context = Navigator.of(ref.context); 

try {
  final credential = await FirebaseAuth
  .instance
  .createUserWithEmailAndPassword(email: email,password: password);
if (kDebugMode) {
  print(credential);
}
if (credential.user!=null) {
  await credential.user?.sendEmailVerification();
  await credential.user?.updateDisplayName(name);
  //get server photo url
  //set user photo url
  toastInfo("An email was sent to your email. kindly verify");
  context.pop();
}
 //write firebase exception errors
 } on FirebaseAuthException catch(e){
   if (e.code =="weak-password") {
     toastInfo("password is too weak");
   }else if(e.code =="email-already-in-use"){
    toastInfo("email already in use");
   }
   else if(e.code =="user-not-found"){
    toastInfo("user not found");
   }
 }

catch (e) {
  if (kDebugMode) {
    print(e.toString());
  }
}
 //show register page again
 ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}