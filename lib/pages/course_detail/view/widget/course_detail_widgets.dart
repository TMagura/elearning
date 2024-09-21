import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecorationImage(
      width: 325,
      height: 200,
      fit: BoxFit.fitWidth,
      imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
    );
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      width: 325,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: appBoxShadow(radius: 7),
              child: const Text12Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    const AppImage(imagePath: ImageRes.people),
                    Text12Normal(
                      text: courseItem.follow == null
                          ? "0"
                          : courseItem.follow.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    const AppImage(imagePath: ImageRes.star),
                    Text12Normal(
                      text: courseItem.score == null
                          ? "0"
                          : courseItem.score.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name??"NO name Found",
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text12Normal(
              textAlign: TextAlign.right,
              text: courseItem.description == null
                  ? "No Description found"
                  : courseItem.description.toString(),
              color: AppColors.primaryThreeElementText,
            ),
          ),
        ],
      ),
    );
  }
}
