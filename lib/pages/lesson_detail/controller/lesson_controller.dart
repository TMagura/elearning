
import 'package:elearning/common/model/lesson_entities.dart';
import 'package:elearning/common/utils/constants.dart';

import 'package:elearning/pages/lesson_detail/repo/lesson_repo.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
//here use part for the path to be used by the auto generation.
part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;


@riverpod
Future<void> LessonDetailController(
    LessonDetailControllerRef ref, {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
      if (response.code ==200) {
        var url = "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url}";
        videoPlayerController = VideoPlayerController.network(url);
        var initialiseVideoPlayerFuture = videoPlayerController?.initialize();
       LessonVideo vidInstance = LessonVideo(
        lessonItem: response.data!,
        isPlay: false,
        initializeVideoPlayer: initialiseVideoPlayerFuture
        );
        videoPlayerController?.play();
        ref.read(lessonDataControllerProvider.notifier).updateLessonData(vidInstance);
        print(url);
      }else{
        print("request failed ${response.code}");
      }
  return null;
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async{
   return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons){
    update((data) => data.copyWith(
      url: lessons.url, 
      initializeVideoPlayer: lessons.initializeVideoPlayer, 
      lessonItem: lessons.lessonItem,
      isPlay: lessons.isPlay
    ));
  }

  void playPause(bool isPlay){
    update((data) => data.copyWith(
      isPlay:isPlay
    ));
  }
}