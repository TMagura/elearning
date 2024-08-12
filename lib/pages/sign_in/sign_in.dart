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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //login buttons
              thirdPartyLogin(),
              //loging option message
              Center(child: text14Normal(text: "Or use your email account to login")),
              SizedBox(height: 50,),
              //email textBox
              appTextField("Email",iconName: "assets/icons/user.png"),
              SizedBox(height: 50,),
              //password textbox
              appTextField("Password", iconName: "assets/icons/lock.png"),
            ],
          ),
        ),
      ),
    );
  }
}
