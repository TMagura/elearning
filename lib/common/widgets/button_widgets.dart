import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appButton({String buttonName = "Login", bool isLogin = true}) {
  return GestureDetector(
    onTap: () {
      print("clicked register button");
      Navigator.pushNamed(context,MaterialPageRoute(builder: builder))
    },
    child: Container(
      width: 325,
      height: 50,
      //check the condition and use a diff color based on different button
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Center(
        child: text16Normal(
            text: buttonName,
            color:
                isLogin ? AppColors.primaryBackground : AppColors.primaryText),
      ),
    ),
  );
}
