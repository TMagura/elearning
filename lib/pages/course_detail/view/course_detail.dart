import 'package:elearning/common/widgets/app_bar.dart';
import 'package:elearning/pages/course_detail/controller/course_controller.dart';
import 'package:elearning/pages/course_detail/view/widget/course_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetail extends ConsumerStatefulWidget {
  //consumerStatefulwidget has a consumer state
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() =>
      _CourseDetailState(); //use the consumer state
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  //use ConsumerState
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id["id"]);
    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppbar(title: "Course Title"),
      body: stateData.when(
          data: (data) => data == null
              ? const SizedBox()
              : Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CourseDetailThumbnail(
                        courseItem: data,
                      ), //thumbnail picture
                      CourseDetailIconText(
                        courseItem: data,
                      ), //ratings and followings
                      CourseDetailDescription(//Course description
                        courseItem: data,
                      ),
                      const CourseDetailGoBuyButton(),
                      CourseDetailIncludes(courseItem: data),
                      LessonInfo(),
                    ],
                  ),
              ),
          error: (error, StackTrace) {
            return const Text("There is an error while loading");
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
