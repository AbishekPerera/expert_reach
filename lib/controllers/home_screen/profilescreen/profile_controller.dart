import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //get userdata from shared preferences

  var isLoading = true.obs;

  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var profilePic = "".obs;

  @override
  void onInit() async {
    super.onInit();
    getUserData();
  }

  //get user data from sharefd preferences
  void getUserData() async {
    isLoading.value = true;

    var userData = await SharedPreferences.getInstance();
    firstName.value = userData.getString("first_name")!;
    lastName.value = userData.getString("last_name")!;
    email.value = userData.getString("email")!;
    phone.value = userData.getString("phone")!;
    profilePic.value = userData.getString("profile_img")!;
    isLoading.value = false;
  }

  void logout() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Yes",
      confirmTextColor: Colors.red,
      textCancel: "No",
      onConfirm: () async {
        var userData = await SharedPreferences.getInstance();
        userData.clear();
        Get.offAllNamed("/login");
      },
    );
  }
}
