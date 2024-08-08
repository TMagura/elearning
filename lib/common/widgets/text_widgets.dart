import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text24Normal({required String text}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.blue,
      fontSize: 24,
      fontWeight: FontWeight.normal
    ),
  );
}

Widget text16Normal({required String text}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.blue,
      fontSize: 16,
      fontWeight: FontWeight.normal
    ),
  );
}