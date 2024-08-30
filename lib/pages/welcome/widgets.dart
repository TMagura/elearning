import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/global.dart';
import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller; 
  final BuildContext context;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index ;
  final String text;
  AppOnboardingPage({super.key,
   required this.context,
   required this.controller,
   required this.imagePath,
   required this.index, 
   required this.subTitle, 
   required this.text, 
   required this.title,
   });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Image.asset(imagePath, fit: BoxFit.fitWidth),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.all(15),
        child: Text16Normal(text: subTitle),
      ),
      _nextButton(index, controller,context,text),
    ],
  );
  }
}



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
        child: Text16Normal(text: subTitle),
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
        //save if app was once opened for the first time.
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
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
        child: Text16Normal(
          text: text,
          color: Colors.white,
        ),
      ),
    ),
  );
}
