import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

AppBar buildAppbar({String title=""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}


AppBar buildGlobalAppbar({String title=""}) {
  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}