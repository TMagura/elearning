import 'package:elearning/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text24Normal(
    {required String text,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24, fontWeight: fontWeight),
  );
}

// Widget text16Normal({
//   required String text,
//   Color color = AppColors.primarySecondaryElementText,
// }) {
//   return Text(
//     text,
//     textAlign: TextAlign.center,
//     style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal),
//   );
// }

//for optimisation use this class name
class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
  }
}

class Text12Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text12Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: 12, fontWeight: fontWeight),
    );
  }
}

Widget text14Normal(
    {required String text,
    Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal),
  );
}

Widget textUnderline({String text = "Forgot Password?"}) {
  return GestureDetector(
    onTap: () {},
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
