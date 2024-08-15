import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';


Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png")
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField(
  String text,
    {String iconName = "", 
    String hintText = "Type in your info",
    bool obscureText=false,
    void Function(String value)? func
    }) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5,),
        Container(
          width: 325,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 18),
                child: appImage(imagePath: iconName),
              ),
              Container(
                width: 280,
                height: 40,
                child: TextField(
                  //used when you type
                  onChanged:(value)=>func!(value),
                  
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
