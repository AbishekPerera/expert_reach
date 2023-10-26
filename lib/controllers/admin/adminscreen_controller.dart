import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  var isLoading = false.obs;

  ServicesService servicesService = ServicesService();

  RxList<ServicesWithLocationsWithUsers> servicesList =
      <ServicesWithLocationsWithUsers>[].obs;
  RxList<ServicesWithLocationsWithUsers> filteredServicesList =
      <ServicesWithLocationsWithUsers>[].obs;
  RxList<ServicesWithLocationsWithUsers> filteredServicesList0 =
      <ServicesWithLocationsWithUsers>[].obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    // Your code here
    await servicesService.initService();
    getAllServicesAdmin();
  }

  void getAllServicesAdmin() async {
    isLoading(true);

    final response = await servicesService.getAllServicesAdmin();

    if (response != null) {
      if (response['response']['state'] == 200) {
        servicesList.clear();
        filteredServicesList.clear();
        for (var item in response['response']['results']) {
          servicesList.add(ServicesWithLocationsWithUsers.fromJson(item));
        }
        filteredServicesList.addAll(servicesList);
        // filterByStatus();
        filteredServicesList0.value = servicesList
            .where((element) => element.services.is_active == "0")
            .toList();
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  void filterBySearch(String search) {
    filteredServicesList.value = servicesList;

    filteredServicesList.value = filteredServicesList
        .where((element) => element.services.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }

  // //filter is_active = 0
  void filterByStatus(String search) {
    filteredServicesList0.value = servicesList
        .where((element) => element.services.is_active == "0")
        .toList();

    filteredServicesList0.value = filteredServicesList0
        .where((element) =>
            element.services.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
