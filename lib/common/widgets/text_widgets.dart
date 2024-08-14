import 'package:elearning/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text24Normal(
    {required String text, Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 24,
        fontWeight: FontWeight.normal),
  );
}

Widget text16Normal(
    {required String text,
    Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.normal),
  );
}

Widget text14Normal(
    {required String text,
    Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.normal),
  );
}

Widget textUnderline({String text="Forgot Password?"}){
  return GestureDetector(
    onTap: () {
      
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
      ),
      ),
  );
}