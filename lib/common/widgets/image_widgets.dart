import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:flutter/cupertino.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const AppImage({super.key, this.height =16, this.width=16,this.imagePath = ImageRes.defautImg });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
    width: width,
    height: height,
  );
  }
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