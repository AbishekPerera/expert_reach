import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSuccessSnackBar(String title, String body, IconData leadingIcon) {
  Get.snackbar(
    title,
    body,
    titleText: Text(title),
    messageText: Text(body),
    forwardAnimationCurve: Curves.decelerate,
    duration: const Duration(milliseconds: 3000),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    overlayBlur: 5,
    icon: Icon(
      leadingIcon,
      color: Colors.green,
    ),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(15),
  );
}
