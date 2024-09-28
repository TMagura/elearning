import 'package:elearning/common/global_loader/global_loader.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_bar.dart';
import 'package:elearning/common/widgets/app_textfields.dart';
import 'package:elearning/common/widgets/button_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:elearning/pages/sign_in/controller/sign_in_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  //use this to make sure that our widget is initialised and no late initialisation will take place
  void didChangeDependencies() {
        _controller = SignInController();
    super.didChangeDependencies(); 
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(title: "Login"),
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //login buttons
                      thirdPartyLogin(),
                      //loging option message
                      Center(
                          child: text14Normal(
                              text: "Or use your email account to login")),
                      const SizedBox(
                        height: 50,
                      ),
                      //email textBox
                      appTextField(
                        text:"Email",
                        controller: _controller.emailcontroller,
                        iconName: "assets/icons/user.png",
                        hintText: "Type in your email @mail.com",
                        obscureText: false,
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      //password textbox
                      appTextField(
                        text:"Password",
                        controller: _controller.passwordController,
                        iconName: "assets/icons/lock.png",
                        hintText: "Type in your 8 character passord",
                        obscureText: true,
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //forgot password text
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: textUnderline(text: "Forgot Password?"),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      // App login button
                      Center(
                        child: AppButton(
                          buttonName: "Login",
                          func: () => _controller.handleSignIn(ref),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //App register button
                      Center(
                        child: AppButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () {
                            Navigator.pushNamed(context, "register");
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              : const Center(
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
