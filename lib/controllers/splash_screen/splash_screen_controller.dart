import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  String? token;
  String? expirationDate;

  Future startAnimation() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () async {
        //check if user is logged in
        final SharedPreferences userdata =
            await SharedPreferences.getInstance();
        token = userdata.getString('token');
        expirationDate = userdata.getString('expirationDate');

        if (token != null &&
            expirationDate ==
                "${DateTime.now().year}/${DateTime.now().month}") {
          Get.offNamed("/home-screen");
        } else {
          await userdata.clear();
          Get.offNamed("/login");
        }
      },
    );
  }
}
