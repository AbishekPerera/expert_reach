import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';

buildHeader(BuildContext context) {
  return Container(
    // color: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
    decoration: BoxDecoration(
      color: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            LogoWhite,
            height: 100,
            width: double.infinity,
          ),
        ),
      ],
    ),
  );
}
