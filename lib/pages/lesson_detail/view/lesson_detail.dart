import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id["id"]);
    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //dispose video controller as we leave page
  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var lessonDetail = ref.watch(LessonDetailControllerProvider(index:args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: lessonData.value!.lessonItem.isEmpty
            ? Container(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  lessonData.when(
                      data: (data) => Column(
                        children: [
                          Container(
                                width: 325,
                                height: 200,
                                decoration: networkImageDecoration(
                                    imagePath:
                                        "${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}"),
                                child: FutureBuilder(
                                    future: data.initializeVideoPlayer,
                                    builder: ((context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return videoPlayerController == null
                                            ? Container()
                                            : Stack(
                                                children: [
                                                  VideoPlayer(
                                                      videoPlayerController!),
                                                ],
                                              );
                                      } else {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    })),
                              ),
                          SizedBox(height: 10,),
                          Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0,top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: const AppImage(
                          width: 24,
                          height: 24,
                          imagePath: ImageRes.left,
                        )),
                        const SizedBox(width: 20,),
                        GestureDetector(
                          onTap: () {
                            if (data.isPlay) {
                              videoPlayerController?.pause();
                              ref.read(lessonDataControllerProvider.notifier).playPause(false);
                            }else{
                              videoPlayerController?.play();
                              ref.read(lessonDataControllerProvider.notifier).playPause(true);
                            }
                          },
                            child: data.isPlay
                            ? const AppImage(
                          width: 24,
                          height: 24,
                          imagePath: ImageRes.pause,
                        )
                            :const AppImage(
                          width: 24,
                          height: 24,
                          imagePath: ImageRes.play,
                        )),
                        const SizedBox(width: 20,),
                        GestureDetector(
                            child: const AppImage(
                          width: 24,
                          height: 24,
                          imagePath: ImageRes.right,
                        )),
                      ],
                    ),
                  ),
                        ],
                      ),
                      error: (e, t) => Text(e.toString()),
                      loading: () => Text("loading")),
                  const SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
      ),
    );
  }
}
