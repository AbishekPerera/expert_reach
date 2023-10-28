import 'package:expert_reach/services/notification_service.dart';
import 'package:get/get.dart';

import '../../utils/theme/getError_snackBar.dart';

class NorificationController extends GetxController {
  var isLoading = true.obs;

  NotificationService notificationService = NotificationService();

  //on init
  @override
  void onInit() async {
    super.onInit();
    await notificationService.initService();
    getNotificationsByUserId();
  }

  //notification list
  var notificationList = [].obs;

  // getNotificationsByUserId
  void getNotificationsByUserId() async {
    isLoading(true);

    final response = await notificationService.getNotificationsByUserId();

    if (response != null) {
      if (response['response']['state'] == 200) {
        notificationList.clear();
        for (var item in response['response']['results']) {
          notificationList.add(item);
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

  void seenNotification(String id) async {
    isLoading(true);

    final response = await notificationService.seenNotification(id);

    if (response != null) {
      if (response['response']['state'] == 200) {
        getNotificationsByUserId();
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
