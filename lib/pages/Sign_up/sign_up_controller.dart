import 'package:elearning/common/widgets/popup_messages.dart';
import 'package:elearning/pages/Sign_up/notifier/register_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//accessing the ref will allows us to access the state object also
class SignUpController{
  late WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp(){
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;
    
    print("your name is $name");
    print("your email is $email");
    print("your password is $password");
    print("your repassword is $rePassword");

    if(state.password!=state.rePassword){
      toastInfo("password didnt match");
    }
  }
}