import 'package:expert_reach/models/data_classes/bookings_users_services_locations_times.dart';
import 'package:expert_reach/models/data_classes/rate_and_reviews__users.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:expert_reach/utils/theme/getSuccess_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateAndReviewController extends GetxController {
  final BookingsUsersServicesLocationsTimes args = Get.arguments;
  var isLoading = true.obs;
  ServicesService servicesService = ServicesService();

  Rx<RateAndReviewsWithUsers?> rateAndReviewsUsers =
      Rx<RateAndReviewsWithUsers?>(null);

  var rating = 0.0.obs;
  TextEditingController reviewController = TextEditingController();
  final GlobalKey<FormState> addOrUpdate = GlobalKey<FormState>();
  var review = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getRateAndReviewByUserIdAndServiceId();
  }

  void getRateAndReviewByUserIdAndServiceId() async {
    isLoading(true);

    final response = await servicesService
        .getRateAndReviewByUserIdAndServiceId(args.bookings.service_id);

    if (response != null) {
      if (response['response']['state'] == 200) {
        if (response['response']['results'] != null &&
            response['response']['results'].isNotEmpty) {
          for (var item in response['response']['results']) {
            final newRateAndReviews = RateAndReviewsWithUsers.fromJson(item);
            if (rateAndReviewsUsers.value == null) {
              rateAndReviewsUsers.value = newRateAndReviews;
            } else {
              // Merge the new data with the existing data if needed
              // For example, if you want to append the new data to a list, do it here.
            }
          }

          if (rateAndReviewsUsers.value != null) {
            reviewController.text =
                rateAndReviewsUsers.value!.rateAndReviews.feedback;
            rating.value =
                double.parse(rateAndReviewsUsers.value!.rateAndReviews.stars);
          }
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

  void addUpdateRateAndReviewByUserIdAndServiceId() async {
    isLoading(true);

    if (addOrUpdate.currentState!.validate()) {
      addOrUpdate.currentState!.save();

      final response =
          await servicesService.addUpdateRateAndReviewByUserIdAndServiceId(
              args.bookings.service_id, rating.value.toString(), review.value);

      if (response != null) {
        if (response['response']['state'] == 200) {
          Get.back();
          getSuccessSnackBar("Success", response['response']['message'],
              Icons.done_all_outlined);
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
