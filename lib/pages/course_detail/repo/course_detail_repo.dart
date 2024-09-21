import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/services/http_util.dart';

class CourseDetailRepo{
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post("api/courseDetail", queryParameters: params?.toJson());
   return  CourseDetailResponseEntity.fromJson(response);
  }
}