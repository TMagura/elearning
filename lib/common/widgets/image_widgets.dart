import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:flutter/cupertino.dart';

Widget appImage({
  String imagePath = ImageRes.defautImg,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
    width: width,
    height: height,
  );
}
//work with a reusable widget
Widget appImageWithColor({
  String imagePath = "assets/icons/user.png",
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement,
}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
    width: width,
    height: height,
    color: color,
  );
}