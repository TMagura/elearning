import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
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

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  double sR = 1.0,
  double bR = 2.0,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
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
    Color bordercolor = AppColors.primaryFourElementText,
    double radius = 15.0,
    double sR = 1.0,
    double bR = 2.0}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: bordercolor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  const AppBoxDecorationImage({
    super.key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
    this.fit = BoxFit.fitHeight,
    this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: fit,
          image: NetworkImage(imagePath),
        ),
      ),
      child: courseItem == null
          ? Container()
          : Column(
              children: [
                Container(
                  child: FadeText(
                    text: courseItem!.name!,
                  ),
                )
              ],
            ),
    );
  }
}
