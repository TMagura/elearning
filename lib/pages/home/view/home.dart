import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/common/widgets/search_widget.dart';
import 'package:elearning/pages/home/controller/home_controller.dart';
import 'package:elearning/pages/home/view/widgets/home_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;
//use didchangeDependency cz it will update the UI weneva there is a change in state or and at init
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(ref),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HelloText(),
              const UserName(),
              const SizedBox(
                height: 20,
              ),
              searchBar(),
              const SizedBox(
                height: 20,
              ),
              HomeBanner(ref: ref, controller: _controller),
              const SizedBox(
                height: 20,
              ),
              const HomeMenuBar(),
              const SizedBox(
                height: 20,
              ),
              const CourseItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
