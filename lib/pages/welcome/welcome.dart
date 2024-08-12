import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/pages/welcome/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/welcome_notifier.dart';

//creating a fixed provider 
final indexProvider = StateProvider<int>((ref) => 0);
//change the consuming widgets to extend a ConsumerWidget
class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  //the builder widget must have the Widget reference as WidgetRef ref as a parameter
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: Colors.amber,
                width: 400,
                child: PageView(
                  //the value here is always the index of next page view by default
                  onPageChanged: (value) {
                    
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller, children: [
                  //first page
                  appOnboardingPage(
                    _controller,context,
                    index: 1,
                    imagePath: "assets/images/reading.png",
                    title: "Welcome to eLearning",
                    subTitle:
                        "Be happy you are in the right place at the the riht time t learn for free",
                  ),
                  //second page
                  appOnboardingPage(
                    _controller,context,
                    index: 2,
                    imagePath: "assets/images/man.png",
                    title: "Learning and be the master",
                    subTitle:
                        "im so glad  to be here and eyy Be happy you are in the right place at the right time to learn for free",
                  ),
                  //third page
                  appOnboardingPage(
                    _controller,context,
                    index: 3,
                    imagePath: "assets/images/boy.png",
                    title: "Connect with every one and learn",
                    subTitle:
                        "Be the first to chat with the lecturer and learn more of everything",
                  ),
                ]),
              ),
              Positioned(
                bottom: 50,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: index,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
