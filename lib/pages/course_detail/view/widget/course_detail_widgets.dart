import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/model/lesson_entities.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/button_widgets.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            text: courseItem.name ?? "NO name Found",
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

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: const AppButton(buttonName: "Go Buy"));
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text16Normal(
            text: "Course Includes",
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          CourseInfo(
            imagePath: ImageRes.videoDetail,
            length: courseItem.video_len,
            infoText: "Hours Long",
          ),
          const SizedBox(
            height: 10,
          ),
          CourseInfo(
            imagePath: ImageRes.fileDetail,
            length: courseItem.lesson_num,
            infoText: "PDF file(s) with study material",
          ),
          const SizedBox(
            height: 10,
          ),
          CourseInfo(
            imagePath: ImageRes.downloadDetail,
            length: courseItem.down_num,
            infoText: "downloads",
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;
  const CourseInfo(
      {super.key,
      required this.imagePath,
      this.length,
      this.infoText = "items"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          imagePath: imagePath,
          width: 30,
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text12Normal(
              text: length.hashCode == null.hashCode
                  ? "0 $infoText"
                  : "$length $infoText"),
        )
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  final WidgetRef ref;
  const LessonInfo({super.key, required this.lessonData, required this.ref});

  @override
  Widget build(BuildContext context) {
    // print("lessons i have are ${lessonData.length}");
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lessonData.isNotEmpty
          ? const Text16Normal(text: "Lesson List", fontWeight: FontWeight.bold)
          : const Text16Normal(text: "Lesson List is Empty", fontWeight: FontWeight.bold),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: lessonData.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(top:10),
                    width: 325,
                    height: 80,
                    decoration: appBoxShadow(
                      radius: 10,
                      sR: 2,
                      bR: 3,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        ref.watch(lessonDetailControllerProvider(index: lessonData[index].id!));
                        Navigator.of(context).pushNamed("lesson_detail",arguments: {
                          "id":lessonData[index].id!
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppBoxDecorationImage(
                            fit: BoxFit.fill,
                            width: 60,
                            height: 60,
                            imagePath:
                                "${AppConstants.IMAGE_UPLOADS_PATH}${lessonData[index].thumbnail}",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text13Normal(
                                  text: "${lessonData[index].name}",
                                  color: AppColors.primaryText,
                                ),
                                Expanded(
                                  child: Text12Normal(
                                    text: "${lessonData[index].description}",
                                    color: AppColors.primarySecondaryElementText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                         
                          const AppImage(
                              width: 30,
                              height: 24,
                              imagePath: ImageRes.arrowRight),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
