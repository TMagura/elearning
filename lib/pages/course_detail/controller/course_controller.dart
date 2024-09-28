import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/model/lesson_entities.dart';
import 'package:elearning/pages/course_detail/repo/course_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//here use part for the path to be used by the auto generation.
part 'course_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(
    CourseDetailControllerRef ref, {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response =
      await CourseRepo.courseDetail(params: courseRequestEntity);
      if (response.code ==200) {
        return response.data;
      }else{
        print("request failed ${response.code}");
      }
  return null;
}

@riverpod
Future<List<LessonItem>?> courseLessonListController(
    CourseLessonListControllerRef ref, {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await CourseRepo.courseLessonList(params: lessonRequestEntity);
      if (response.code ==200) {
        return response.data;
      }else{
        print("request failed ${response.code}");
      }
  return null;
}
