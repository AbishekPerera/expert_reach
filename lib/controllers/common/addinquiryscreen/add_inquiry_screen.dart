import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/models/entities/availabletime.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:expert_reach/utils/theme/getSuccess_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInquiryController extends GetxController {
  var isLoading = false.obs;
  final ServicesService servicesService = ServicesService();

  //get arguments
  final ServicesWithLocationsWithUsers arguments = Get.arguments;

  RxList<AvailableTime> times = <AvailableTime>[].obs;
  var selectedDate = DateTime.now().obs;
  RxList<AvailableTime> selectedTimes = <AvailableTime>[].obs;
  TextEditingController notesController = TextEditingController();

  final GlobalKey<FormState> addbooking = GlobalKey<FormState>();
  String notes = "";

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getTimes();
  }

  //get times
  void getTimes() async {
    isLoading(true);
    // clear
    times.clear();
    selectedTimes.clear();

    // set selected date like 2023-10-19
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
    );

    final response = await servicesService.getTimes(
        arguments.users.id, selectedDate.value.toString());

    if (response != null) {
      if (response['response']['state'] == 200) {
        times.value = response['response']['results']
            .map<AvailableTime>((json) => AvailableTime.fromJson(json))
            .toList();
        // print(times);
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  //add times to array
  void addTimes(AvailableTime time) {
    if (selectedTimes.contains(time)) {
      selectedTimes.remove(time);
    } else {
      selectedTimes.add(time);
    }
  }

  void addBooking() async {
    isLoading(true);

    if (selectedTimes.isEmpty) {
      isLoading(false);
      //show error
      Get.showSnackbar(const GetSnackBar(
        message: "Please select time",
        duration: Duration(seconds: 1),
      ));
      return;
    }

    if (addbooking.currentState!.validate()) {
      addbooking.currentState!.save();

      //convert selected times to coma separated string
      final timeFrom = selectedTimes.map((e) => e.id).toList().join(',');

      //remove last values and returns only date as string like 2023-10-19
      final date = selectedDate.value.toString().split(' ')[0];

      final response = await servicesService.addBooking(
          arguments.users.id, arguments.services.id, date, timeFrom, notes);

      if (response != null) {
        if (response['response']['state'] == 200) {
          Get.back();

          getSuccessSnackBar(
              "Success", "Booking added successfully", Icons.done_all_outlined);
        } else {
          getErrorSnackBar("Bad Request", response['response']['message']);
        }
      } else {
        getErrorSnackBar(
            "Bad Request", "Something went wrong please Login again");
      }
    }
    isLoading(false);
  }
}
