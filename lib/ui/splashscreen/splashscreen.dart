import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return const Scaffold(
      body: Stack(
        children: [
          PhloxAnimations(
            duration: Duration(seconds: 3),
            fromOpacity: 0,
            fromScale: 0.8,
            child: Center(
              child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(image: AssetImage(LogoPng))),
            ),
          ),
        ],
      ),
    );
  }
}
