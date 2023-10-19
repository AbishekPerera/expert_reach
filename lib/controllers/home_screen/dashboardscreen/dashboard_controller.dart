import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isLoading = true.obs;

  ServicesService servicesService = ServicesService();

  //get userdata from shared preferences
  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getSuggestedServices();
  }

  RxList<ServicesWithLocationsWithUsers> servicesList =
      <ServicesWithLocationsWithUsers>[].obs;
  void getSuggestedServices() async {
    isLoading(true);

    final response = await servicesService.getSuggestedServices();

    if (response != null) {
      if (response['response']['state'] == 200) {
        servicesList.clear();
        for (var item in response['response']['results']) {
          servicesList.add(ServicesWithLocationsWithUsers.fromJson(item));
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
}
