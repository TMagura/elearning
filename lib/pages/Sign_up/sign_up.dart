import 'package:elearning/common/widgets/app_bar.dart';
import 'package:elearning/common/widgets/button_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/pages/Sign_up/notifier/register_notifier.dart';
import 'package:elearning/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regProvider. will give us access to all the infor in the register state class
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(title: "Sign Up"),
          body: SingleChildScrollView(
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
                appTextField("Username",
                    iconName: "assets/icons/user.png",
                    hintText: "Type in your username",
                    obscureText: false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value),
                    ),
                const SizedBox(
                  height: 30,
                ),
                //email textbox
                appTextField("Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Type in your email @mail.com",
                    obscureText: false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value),
                    ),
                const SizedBox(
                  height: 30,
                ),
                //password textbox
                appTextField("Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Type in your 8 character password",
                    obscureText: true,
                    func: (value)=>print(value),
                    ),
                const SizedBox(
                  height: 15,
                ),
                //confirm password textbox
                appTextField("Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Confirm your password",
                    obscureText: true, 
                    func: (value)=>print(value),
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
                      context: context),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
