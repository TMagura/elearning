import 'package:elearning/pages/sign_in/notifier/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// we use the old way of creating Notifier
//the SignInState is a parameter in parent class as stste so we created our own state the signinstate
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(SignInState());

  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }
   void onUserPasswordChange(String password){
    state = state.copyWith(password: password);
  }
}
//providers exposes our state to the UI 
final signInNotifierProvider = StateNotifierProvider<SignInNotifier,SignInState>(
  (ref) => SignInNotifier());