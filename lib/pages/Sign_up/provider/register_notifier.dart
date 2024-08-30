import 'package:elearning/pages/Sign_up/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier{
   @override
 //this build is our stateProvider must provide wat will be returned
 RegisterState build(){
  return RegisterState();
 }
 //functions to track changes in text fields
 void onUserNameChange(String name){
  state= state.copyWith(userName:name);
 }
  void onUserEmailChange(String email){
  state= state.copyWith(email:email);
 }

  void onUserPasswordChange(String password){
  state= state.copyWith(password:password);
 }

  void onUserRepasswordChange(String rePassword){
  state= state.copyWith(rePassword:rePassword);
 }
}