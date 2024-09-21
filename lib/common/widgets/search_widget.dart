import 'package:elearning/common/utils/app_colors.dart';
import 'package:elearning/common/utils/image_res.dart';
import 'package:elearning/common/widgets/app_shadow.dart';
import 'package:elearning/common/widgets/app_textfields.dart';
import 'package:elearning/common/widgets/image_widgets.dart';
import 'package:flutter/material.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280,
        height: 40,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            //search icon
            Container(
              margin: EdgeInsets.only(left: 17),
              child: const AppImage(imagePath: ImageRes.searchIcon),
            ),
            //search container where to type
            Container(
              width: 240,
              height: 40,
              margin: const EdgeInsets.only(top: 20),
              child: appTextFieldOnly(
                  width: 240, height: 40, hintTexts: "Search course"),
            ),
          ],
        ),
      ),
      //filter options
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 40,
          height: 40,
          child: const AppImage(imagePath: ImageRes.searchButton),
          decoration: appBoxShadow(
            border: Border.all(color: AppColors.primaryElement),
          ),
        ),
      ),
    ],
  );
}
