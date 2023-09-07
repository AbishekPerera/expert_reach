import 'package:get/get.dart';

class DashboardController extends GetxController {
  // final HomeScreenController homeScreenController = Get.find();

  var isLoading = true.obs;

  //user data
  var email = "sample@gmail.com".obs;
  var name = "Sunera Abishek".obs;
  var surname = "Perera".obs;
  var employeeId = "STD2120".obs;

  //get userdata from shared preferences
  @override
  void onInit() async {
    super.onInit();
    await getDataFromSharedPref();
    isLoading.value = false;
  }

  void goToQickLinks(int route) {
    // print("route: $route");

    switch (route) {
      case 0:
        // Get.toNamed("/AttendanceScreen");
        break;

      case 1:
        // homeScreenController.selectedIndex.value = 2;
        break;

      case 2:
        // Get.toNamed("/ExaminationsScreen", arguments: 0);
        break;

      case 5:
        // homeScreenController.selectedIndex.value = 1;
        break;

      case 8:
        // homeScreenController.selectedIndex.value = 3;
        break;

      default:
    }
  }

  Future getDataFromSharedPref() async {
    // await Future.delayed(Duration(seconds: 2));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // email.value = prefs.getString("email")!;
    // name.value = prefs.getString("name")!;
    // surname.value = prefs.getString("surname")!;
    // employeeId.value = prefs.getString("employee_id")!;
  }
}
