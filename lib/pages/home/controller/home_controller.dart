import 'package:elearning/common/model/entities.dart';
import 'package:elearning/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//here use part for the path to be used by the auto generation.
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots{
   int build(){
  return 0;
 }

void setIndex(int value){
  state = value;
}

}

@riverpod 
class HomeUserProfile extends _$HomeUserProfile{
  FutureOr<UserProfile> build(){
    return Global.storageService.getUserProfile();
  }
}