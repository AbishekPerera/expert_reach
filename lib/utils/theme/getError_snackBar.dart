import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getErrorSnackBar(String title, String body) {
  Get.snackbar(
    title,
    body,
    titleText: Text(title),
    messageText: Text(body),
    forwardAnimationCurve: Curves.bounceInOut,
    duration: const Duration(milliseconds: 3000),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    overlayBlur: 5,
    icon: const Icon(
      Icons.error_outline_outlined,
      color: Colors.red,
    ),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(15),
  );
}
