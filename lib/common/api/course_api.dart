import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/services/http_util.dart';

class CourseAPI {

  static Future<CourseListResponseEntity>courseList() async{
    var response =await HttpUtil().post(
      "api/courseList"
    );
    return CourseListResponseEntity.fromJson(response);
  }
}