import 'package:elearning/common/widgets/button_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppbar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //login buttons
                thirdPartyLogin(),
                //loging option message
                Center(
                    child:
                        text14Normal(text: "Or use your email account to login")),
                const SizedBox(
                  height: 50,
                ),
                //email textBox
                appTextField("Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Type in your email @mail.com",
                    obscureText: false),
                const SizedBox(
                  height: 30,
                ),
                //password textbox
                appTextField("Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Type in your 8 character passord",
                    obscureText: true),
                const SizedBox(
                  height: 15,
                ),
                //forgot password text
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: textUnderline(text: "Forgot Password?"),
                ),
                const SizedBox(
                  height: 100,
                ),
                // App login button
                Center(child: appButton(buttonName: "Login")),
                const SizedBox(
                  height: 10,
                ),
                //App register button
                Center(
                  child: appButton(
                    buttonName: "Register",
                    isLogin: false,
                  ),
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
