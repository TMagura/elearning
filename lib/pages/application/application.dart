// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elearning/pages/application/notifier/application_nav_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/pages/application/view/widgets/widgets.dart';

class Application extends ConsumerWidget {
   const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Scaffold(
      body: Container(child: appScreens(index: index),),
      bottomNavigationBar: Container(
        width: 375,
        height: 58,
        decoration: appBoxShadowWithRadius(),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value){
            ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
            
          }, 
          elevation: 0.0,
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,//works to animate change in tabs
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryElement, 
          unselectedItemColor: AppColors.primaryFourElementText,
        ),
      ),
    );
  }
}
