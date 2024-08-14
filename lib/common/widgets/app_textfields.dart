
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget appTextField(
  String text,
    {String iconName = "", String hintText = "Type in your info",bool obscureText=false}) {
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
                  //used when you type
                  onChanged: (value) {},
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
