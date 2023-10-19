import 'package:expert_reach/models/data_classes/services__locations.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;

  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var profilePic = "".obs;

  ServicesService servicesService = ServicesService();
  RxList<ServicesLocations> servicesList = <ServicesLocations>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getUserData();
    getServicesByUserId();
    getSearchTermsByUserId();
  }

  TextEditingController searchTermsController = TextEditingController();

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

  // get user's services
  void getServicesByUserId() async {
    isLoading(true);

    final response = await servicesService.getServicesByUserId();

    // print(response);

    if (response != null) {
      if (response['response']['state'] == 200) {
        servicesList.clear();
        for (var item in response['response']['results']) {
          servicesList.add(ServicesLocations.fromJson(item));
        }
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  //get getSearchTermsByUserId
  void getSearchTermsByUserId() async {
    isLoading(true);

    final response = await servicesService.getSearchTermsByUserId();

    // print(response);

    if (response != null) {
      if (response['response']['state'] == 200) {
        if (response['response']['results'].length > 0) {
          searchTermsController.text =
              response['response']['results'][0]['user_keywords_keywords'];
        }
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
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

  void addSearchTerms() async {
    isLoading(true);

    final response =
        await servicesService.addSearchTerms(searchTermsController.text);

    // print(response);

    if (response != null) {
      if (response['response']['state'] == 200) {
        getSearchTermsByUserId();
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }
}
