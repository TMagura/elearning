import 'package:elearning/common/api/course_api.dart';
import 'package:elearning/common/model/course_entities.dart';
import 'package:elearning/common/model/entities.dart';
import 'package:elearning/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//here use part for the path to be used by the auto generation.
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots{
   @override
     int build(){
  return 0;
 }

void setIndex(int value){
  state = value;
}

}
//and async provider uses FutureOr
@riverpod 
class HomeUserProfile extends _$HomeUserProfile{
  @override
  FutureOr<UserProfile> build(){
    return Global.storageService.getUserProfile();
  }
}

//provider for the courseList as it
@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList{
  Future<List<CourseItem>?> fetchCourseList() async{
    var result = await CourseAPI.courseList();

    if(result.code == 200){
      return result.data;
    }
    return null;
  }

 //data can be future type or any data so yu can wait or not this optimises our app
  @override
  FutureOr<List<CourseItem>?> build() async {
    return fetchCourseList();
  }
}