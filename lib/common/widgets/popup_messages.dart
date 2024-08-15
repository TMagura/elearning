import 'package:elearning/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//this type is a positional optional parameter with []
toastInfo(String msg,
 {Color backgroundColor= Colors.blue, Color textColor = Colors.white}){
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16,
    );
}