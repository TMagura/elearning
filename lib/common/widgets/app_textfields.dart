import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget appTextField({
  String text = "",
  TextEditingController? controller,
  String iconName = "",
  String hintText = "",
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 18),
                child: AppImage(imagePath: iconName),
              ),
              appTextFieldOnly(
                width: 260, 
                height: 50, 
                hintTexts: hintText,
                controller: controller,
                func: func,
                obscureText: obscureText
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  String hintTexts = "",
  double width = 240,
  double height = 50,
  TextEditingController? controller,
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintTexts,
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
  );
}
