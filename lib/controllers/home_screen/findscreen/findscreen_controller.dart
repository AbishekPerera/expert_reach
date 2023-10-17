import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:get/get.dart';

class FindScreenController extends GetxController {
  var isLoading = false.obs;

  ServicesService servicesService = ServicesService();

  RxList<ServicesWithLocationsWithUsers> servicesList =
      <ServicesWithLocationsWithUsers>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    getAllServices();
  }

  void getAllServices() async {
    isLoading(true);

    final response = await servicesService.getAllServices();

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
