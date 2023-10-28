import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/models/entities/locations.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindScreenController extends GetxController {
  var isLoading = false.obs;

  ServicesService servicesService = ServicesService();

  RxList<ServicesWithLocationsWithUsers> servicesList =
      <ServicesWithLocationsWithUsers>[].obs;
  RxList<ServicesWithLocationsWithUsers> filteredServicesList =
      <ServicesWithLocationsWithUsers>[].obs;

  RxList<Locations> locationsList = RxList<Locations>([]);
  var selectedLocation = "".obs;
  var selectedRating = "All".obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getAllServices();
    getLocations();
  }

  void getAllServices() async {
    isLoading(true);

    final response = await servicesService.getAllServices();

    if (response != null) {
      if (response['response']['state'] == 200) {
        servicesList.clear();
        filteredServicesList.clear();
        for (var item in response['response']['results']) {
          servicesList.add(ServicesWithLocationsWithUsers.fromJson(item));
        }
        filteredServicesList.addAll(servicesList);
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  //getLocations
  void getLocations() async {
    isLoading(true);

    final response = await servicesService.getLocations();
    // print(response);

    if (response != null) {
      if (response['response']['state'] == 200) {
        locationsList.value = List<Locations>.from(
            response['response']['results'].map((x) => Locations.fromJson(x)));
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  void filterByLocation(String location) {
    filteredServicesList.value = filteredServicesList
        .where((element) => element.locations.id == location)
        .toList();
    print(location);
  }

  void filterByRating(String rating) {
    double selectedRating = double.tryParse(rating) ?? 0.0;

    filteredServicesList.value = filteredServicesList
        .where((element) => double.parse(element.stars) >= selectedRating)
        .toList();
    print(rating);
  }

  void filterBySearch(String search) {
    filteredServicesList.value = servicesList;
    //clear selected rating and location
    selectedLocation.value = "";
    selectedRating.value = "All";

    filteredServicesList.value = filteredServicesList
        .where((element) => element.services.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    print(search);
  }

  //filter services
  // void filterServices() {
  //   // First, parse the selectedRating as a double
  //   double selectedRatingValue = selectedRating.value == "All"
  //       ? 0.0
  //       : double.tryParse(selectedRating.value) ?? 0.0;

  //   // Filter services based on selected criteria
  //   filteredServicesList.assignAll(servicesList.where((service) {
  //     bool passesLocationFilter = selectedLocation.value.isEmpty ||
  //         service.services.location_id == selectedLocation.value;

  //     bool passesRatingFilter = selectedRatingValue == 0.0 ||
  //         double.parse(service.stars) >= selectedRatingValue;

  //     bool passesSearchFilter = searchController.text.isEmpty ||
  //         service.services.title
  //             .toLowerCase()
  //             .contains(searchController.text.toLowerCase());

  //     return passesLocationFilter && passesRatingFilter && passesSearchFilter;
  //   }));
  // }

  // void filterServices() {
  //   // Clear the filtered list before filtering
  //   filteredServicesList.clear();

  //   // Convert the selectedRating to a double (assuming "All" means no rating filter)
  //   double selectedRatingValue = (selectedRating.value == "All")
  //       ? 0.0
  //       : double.tryParse(selectedRating.value) ?? 0.0;

  //   // Filter based on selectedLocation, selectedRating, and searchController
  //   for (var service in servicesList) {
  //     if (selectedLocation.value.isEmpty ||
  //         service. .locationName == selectedLocation.value) {
  //       if (selectedRatingValue == 0.0 ||
  //           service.rating >= selectedRatingValue) {
  //         if (searchController.text.isEmpty ||
  //             service.title
  //                 .toLowerCase()
  //                 .contains(searchController.text.toLowerCase())) {
  //           filteredServicesList.add(service);
  //         }
  //       }
  //     }
  //   }
  // }

  void filterServices() async {
    if (selectedRating.value == "all") {
      selectedRating.value = "0";
    }

    double selectedRatingValue = double.tryParse(selectedRating.value) ?? 0.0;

    if (selectedLocation.value == "" &&
        selectedRating.value == "" &&
        searchController.text == "") {
      filteredServicesList.value = servicesList;
    } else if (selectedLocation.value != "" &&
        selectedRating.value == "" &&
        searchController.text == "") {
      filteredServicesList.value = servicesList
          .where((element) =>
              element.services.location_id == selectedLocation.value)
          .toList();
    } else if (selectedLocation.value == "" &&
        selectedRating.value != "" &&
        searchController.text == "") {
      filteredServicesList.value = servicesList
          .where(
              (element) => double.parse(element.stars) >= selectedRatingValue)
          .toList();
    } else if (selectedLocation.value == "" &&
        selectedRating.value == "" &&
        searchController.text != "") {
      filteredServicesList.value = servicesList
          .where((element) => element.services.title
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    } else if (selectedLocation.value != "" &&
        selectedRating.value != "" &&
        searchController.text == "") {
      filteredServicesList.value = servicesList
          .where((element) =>
              element.services.location_id == selectedLocation.value &&
              double.parse(element.stars) >= selectedRatingValue)
          .toList();
    } else if (selectedLocation.value != "" &&
        selectedRating.value == "" &&
        searchController.text != "") {
      filteredServicesList.value = servicesList
          .where((element) =>
              element.services.location_id == selectedLocation.value &&
              element.services.title
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    } else if (selectedLocation.value == "" &&
        selectedRating.value != "" &&
        searchController.text != "") {
      filteredServicesList.value = servicesList
          .where((element) =>
              double.parse(element.stars) >= selectedRatingValue &&
              element.services.title
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    } else if (selectedLocation.value != "" &&
        selectedRating.value != "" &&
        searchController.text != "") {
      filteredServicesList.value = servicesList
          .where((element) =>
              element.services.location_id == selectedLocation.value &&
              double.parse(element.stars) >= selectedRatingValue &&
              element.services.title
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    } else {
      filteredServicesList.value = servicesList;
    }
  }
}
