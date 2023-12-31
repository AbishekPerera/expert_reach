import 'package:expert_reach/services/auth_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:expert_reach/utils/theme/getSuccess_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  //:::::::::::::::::::::::::::::::::::::::password area
  var obscurePWText = true.obs;
  var isLoading = false.obs;

  togglePassword() {
    if (obscurePWText.value == true) {
      obscurePWText.value = false;
    } else {
      obscurePWText.value = true;
    }
  }

  // ::::::::::::::::::::::::::::::::::::::::::Form area

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController userNameController, passwordController;
  var userName = "", password = "";

  // email validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }

    return null;
  }

  //password validation
  String? validatePassword(String value) {
    if (value.length <= 4) {
      return "Password must be of 8 chars";
    }

    return null;
  }

  // form key validation
  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    // print(username);
    loginToDashboard();
  }

  Future loginToDashboard() async {
    // Get.toNamed("/home-screen");
    isLoading.value = true;

    final AuthService authService = AuthService();

    var responseData = await authService.Login(userName, password);
    print(responseData);

    if (responseData['response']['state'] == 200) {
      //when login success

      if (responseData['response']['results']['token'] != "" &&
          responseData['response']['results']['loggedIn'] == true) {
        // init shared preferences
        SharedPreferences userdata = await SharedPreferences.getInstance();
        userdata.setString(
            "token", responseData['response']['results']['token']);
        userdata.setString(
            "email", responseData['response']['results']['email']);
        userdata.setString(
            "first_name", responseData['response']['results']['first_name']);
        userdata.setString(
            "last_name", responseData['response']['results']['last_name']);
        userdata.setString(
            "phone", responseData['response']['results']['phone']);
        userdata.setString(
            "profile_img", responseData['response']['results']['profile_img']);
        userdata.setString(
            'expirationDate', "${DateTime.now().year}/${DateTime.now().month}");

        getSuccessSnackBar("Welcome back!", "You have successfully logged in",
            Icons.done_all_outlined);

        Get.offNamed("/home-screen");
      } else {
        //Login Error
        getErrorSnackBar("Error", "Authentication failed");
      }
    } else {
      getErrorSnackBar("Error", responseData['response']['results']);
    }
    isLoading.value = false;
  }

  void logOut() async {
    print("logout called");
    SharedPreferences userdata = await SharedPreferences.getInstance();
    // Get.delete<HomeScreenController>();
    // Get.delete<AcademicsController>();
    // Get.delete<TeacherTimeTableController>();
    // Get.delete<DashboardController>();
    // Get.delete<ProfileScreenController>();

    await userdata.remove("token");
    await userdata.clear();
    Get.offAllNamed("/login");
  }
}
