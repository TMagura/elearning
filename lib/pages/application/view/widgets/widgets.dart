import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:elearning/pages/home/view/home.dart';
import 'package:flutter/material.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: "Home",
    backgroundColor: AppColors.primaryBackground,
    icon: bottomContainer(imagePath: "assets/icons/home.png"),
    activeIcon: bottomContainer(color: AppColors.primaryElement)
  ),
    BottomNavigationBarItem(
      label: "Search",
      backgroundColor: AppColors.primaryBackground,
      icon: bottomContainer(imagePath: "assets/icons/search.png"),
      activeIcon: bottomContainer(color: AppColors.primaryElement)
  ),
      BottomNavigationBarItem(
      label: "Play",
      backgroundColor: AppColors.primaryBackground,
      icon: bottomContainer(imagePath: "assets/icons/play-circle1.png"),
      activeIcon: bottomContainer(color: AppColors.primaryElement)
  ),
      BottomNavigationBarItem(
      label: "Message",
      backgroundColor: AppColors.primaryBackground,
      icon: bottomContainer(imagePath: "assets/icons/message-circle.png"),
      activeIcon: bottomContainer(color: AppColors.primaryElement)
  ),
      BottomNavigationBarItem(
      label: "Profile",
      backgroundColor: AppColors.primaryBackground,
      icon: bottomContainer(imagePath: "assets/icons/person.png"),
      activeIcon: bottomContainer(color: AppColors.primaryElement)
  ),
];

Widget bottomContainer({
  double width =15,
  double height = 15, 
  String imagePath = "assets/icons/home.png", 
  Color color = AppColors.primaryFourElementText,
  }){
  return SizedBox(
      width: width,
      height: height,
      child: appImageWithColor(imagePath: imagePath,color: color),
    );
}

Widget appScreens({int index=0}){
  List<Widget> _screens = [
   const Home(),
   const Center(child: AppImage(imagePath: ImageRes.search),),
   const Center(child: AppImage(imagePath: ImageRes.play),),
   const Center(child: AppImage(imagePath: ImageRes.message),),
   const Center(child: AppImage(imagePath: ImageRes.profile),),
  ];
  return _screens[index];
}
