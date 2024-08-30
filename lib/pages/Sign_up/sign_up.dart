import 'package:elearning/common/global_loader/global_loader.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_bar.dart';
import 'package:elearning/common/widgets/app_textfields.dart';
import 'package:elearning/common/widgets/button_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/pages/Sign_up/controller/sign_up_controller.dart';
import 'package:elearning/pages/Sign_up/provider/register_notifier.dart';
import 'package:elearning/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//convert to consumer statefulWidget
class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
late SignUpController _controller;

@override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regProvider. will give us access to all the infor in the register state class
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(title: "Sign Up"),
          body: loader==false?SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                //loging option message
                Center(
                    child: text14Normal(
                        text: "Enter your details below and free sign up")),
                const SizedBox(
                  height: 50,
                ),
                //Username textBox
                appTextField(text:"Username",
                    iconName: "assets/icons/user.png",
                    hintText: "Type in your username",
                    obscureText: false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value),
                    ),
                const SizedBox(
                  height: 30,
                ),
                //email textbox
                appTextField(text:"Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Type in your email @mail.com",
                    obscureText: false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value),
                    ),
                const SizedBox(
                  height: 30,
                ),
                //password textbox
                appTextField(text:"Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Type in your 8 character password",
                    obscureText: true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserPasswordChange(value),
                    ),
                const SizedBox(
                  height: 15,
                ),
                //confirm password textbox
                appTextField(text:"Confirm Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Confirm your password",
                    obscureText: true, 
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserRepasswordChange(value),
                    ),
                const SizedBox(
                  height: 15,
                ),
                //forgot password text
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: text14Normal(text: "By registering you agree to our terms and conditions")
                ),
                const SizedBox(
                  height: 100,
                ),
                //App register button
                Center(
                  child: appButton(
                      buttonName: "Register", 
                      isLogin: true, 
                      context: context,
                       func: () => _controller.handleSignUp(),
                      ),
                      
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ):const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: AppColors.primaryElement,
            ),
          ),
        ),
      ),
    );
  }
}
