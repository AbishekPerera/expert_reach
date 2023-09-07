import 'package:get/get.dart';
import 'package:expert_reach/controllers/home_screen/home_controller.dart';

class NavigationDrawerController extends GetxController {
  final HomeController homeController = Get.find();

  goToDashboard() {
    homeController.selectedIndex.value = 0;
  }

  goToAcademics() {
    homeController.selectedIndex.value = 1;
  }

  goToHomework() {
    homeController.selectedIndex.value = 2;
  }

  goToProfile() {
    homeController.selectedIndex.value = 3;
  }
}
