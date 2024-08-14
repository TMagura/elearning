import 'package:elearning/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15.0,
    double sR = 1.0,
    double bR = 2.0,
    BoxBorder? border,
    }) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
          color: Colors.blue.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: Offset(0, 7))
    ],
  );
}


BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    Color bordercolor= AppColors.primaryFourElementText,
    double radius = 15.0,
    double sR = 1.0,
    double bR = 2.0}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color:bordercolor),
  );
}