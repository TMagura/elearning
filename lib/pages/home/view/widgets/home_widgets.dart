import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/common/routes/app_routes_names.dart';
import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:elearning/global.dart';
import 'package:elearning/pages/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.ref, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 325,
          height: 160,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        DotsIndicator(
          dotsCount: 3,
          position: ref.watch(homeScreenBannerDotsProvider),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}

Widget bannerContainer({String? imagePath}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath!),
        fit: BoxFit.fill,
      ),
    ),
  );
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello first page",
          color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: Global.storageService.getUserProfile().name!,
          fontWeight: FontWeight.bold),
    );
  }
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    title: Container(
      margin: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppImage(imagePath: ImageRes.menu),
          profileState.when(
            data: (data) => GestureDetector(
              child: AppBoxDecorationImage(
                imagePath: "${AppConstants.SERVER_API_URL}${data.avatar}",
              ),
            ),
            error: (err, stack) => const AppImage(imagePath: ImageRes.profile),
            loading: () => Container(),
          ),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //choose and view all row
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text16Normal(
                text: "Choose your course",
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text12Normal(
                  text: "view all",
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        //select item buttons
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: appBoxShadow(radius: 7),
                child: const Text12Normal(
                  text: "All",
                  color: AppColors.primaryElementText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration:
                    appBoxShadow(radius: 7, color: AppColors.primaryBackground),
                child: const Text12Normal(
                  text: "Popular",
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration:
                    appBoxShadow(radius: 7, color: AppColors.primaryBackground),
                child: const Text12Normal(
                  text: "Newest",
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      child: courseState.when(
        data: ((data) => GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
              ),
              itemCount: data
                  ?.length, //never forget to put itemcount the app will crush with no error log
              itemBuilder: (context, int index) {
                return AppBoxDecorationImage(
                  imagePath:
                      "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail!}",
                  fit: BoxFit.fitWidth,
                  courseItem: data[index],
                  func: () {
                    Navigator.of(context).pushNamed(AppRoutesNames.COURSE_DETAIL,arguments: {
                      "id": data[index].id!,
                    });
                  },
                );
              },
            )),
        error: ((error, stackTrace) => Center(child: Text("$stackTrace"))),
        loading: () => const Center(
          child: Text('loading'),
        ),
      ),
    );
  }
}
