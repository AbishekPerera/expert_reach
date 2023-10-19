import 'package:expert_reach/models/data_classes/bookings_users_services_locations_times.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:get/get.dart';

class CustomerInquiriesControllers extends GetxController {
  var isLoading = false.obs;

  ServicesService servicesService = ServicesService();
  RxList<BookingsUsersServicesLocationsTimes> busltList =
      RxList<BookingsUsersServicesLocationsTimes>([]);

  RxList<BookingsUsersServicesLocationsTimes> filterBusltList =
      RxList<BookingsUsersServicesLocationsTimes>([]);

  //drop down field key
  var dropDownValue = "All".obs;

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getBookingsByServiceProviderId();
  }

  //getBookingsByServiceProviderId
  void getBookingsByServiceProviderId() async {
    isLoading(true);
    dropDownValue.value = "All";

    final response = await servicesService.getBookingsByServiceProviderId();

    if (response != null) {
      if (response['response']['state'] == 200) {
        busltList.clear();
        for (var item in response['response']['results']) {
          busltList.add(BookingsUsersServicesLocationsTimes.fromJson(item));
        }

        filterBusltList.assignAll(busltList);
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  void filterList(String filter) {
    dropDownValue.value = filter;
    if (filter == "All") {
      filterBusltList.assignAll(busltList);
    } else {
      filterBusltList.assignAll(busltList
          .where((element) =>
              element.bookings.status.toLowerCase() == filter.toLowerCase())
          .toList());
    }
  }

  void updateBookingStatus(String id, String status) async {
    isLoading(true);
    final response = await servicesService.updateBookingStatus(id, status);

    if (response != null) {
      if (response['response']['state'] == 200) {
        Get.back();
        Get.back();
        getBookingsByServiceProviderId();
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  // void deleteBooking(String id) async {
  //   isLoading(true);
  //   final response = await servicesService.deleteBooking(id);

  //   if (response != null) {
  //     if (response['response']['state'] == 200) {
  //       Get.back();
  //       Get.back();

  //       getBookingsByServiceProviderId();
  //     } else {
  //       getErrorSnackBar("Bad Request", response['response']['message']);
  //     }
  //   } else {
  //     getErrorSnackBar(
  //         "Bad Request", "Something went wrong please Login again");
  //   }

  //   isLoading(false);
  // }
}
