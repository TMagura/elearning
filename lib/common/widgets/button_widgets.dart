import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final BuildContext? context;
  final String buttonName; 
  final bool isLogin;
  final void Function()? func;

  const AppButton({super.key,
  this.context,
  this.buttonName = "Login", 
  this.isLogin = true,
  this.func, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      if(func==null){
        print("this handler is null");
      }else{
        func;
      };
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
        child: Text16Normal(
            text: buttonName,
            color:
                isLogin ? AppColors.primaryBackground : AppColors.primaryText),
      ),
    ),
  );
  }
}
