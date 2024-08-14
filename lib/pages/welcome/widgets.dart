import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

Widget appOnboardingPage(
  PageController controller, BuildContext context,
  {String imagePath = "assets/images/reading.png",
  String title = "",
  String subTitle = "",
  int index = 0,
  String text="Next",
}) {
  return Column(
    children: [
      Image.asset(imagePath, fit: BoxFit.fitWidth),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.all(15),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller,context,text),
    ],
  );
}

Widget _nextButton(int index,PageController controller, BuildContext context,String text) {
  return GestureDetector(
    onTap: () {
      //the index will be checked and it jumps to next page
      if(index<3){
       controller.animateToPage(
        index, 
        duration: Duration(milliseconds: 300), 
        curve: Curves.linear);
      }else{
          Navigator.pushNamed(
              context,
              "signIn",
            );
      }
      print("index is ${index}");
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
          text: text,
          color: Colors.white,
        ),
      ),
    ),
  );
}
