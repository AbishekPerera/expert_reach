import 'package:expert_reach/models/data_classes/rate_and_reviews__users.dart';
import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:get/get.dart';

class ViewPostScreenController extends GetxController {
  var isLoading = true.obs;

  final ServicesWithLocationsWithUsers arguments = Get.arguments;

  final ServicesService servicesService = ServicesService();

  var bannerImage = "".obs;
  var profileImage = "".obs;

  var title = "".obs;
  var description = "".obs;
  var price = "".obs;
  var location = "".obs;
  var stars = 0.0.obs;

  var serviceProviderName = "".obs;

  RxList<RateAndReviewsWithUsers> RateAndReviewsWithUsersList =
      RxList<RateAndReviewsWithUsers>([]);

  @override
  void onInit() async {
    super.onInit();
    await servicesService.initService();
    await getArgumentData();
    getRateAndReviewsByServiceId();
  }

  Future<void> getArgumentData() async {
    isLoading(true);
    bannerImage.value = arguments.services.image;
    profileImage.value = servicesService.profile_img!;
    title.value = arguments.services.title;
    description.value = arguments.services.description;
    price.value = arguments.services.rates;
    location.value = arguments.locations.name;
    stars.value = double.parse(arguments.stars.toString());
    serviceProviderName.value =
        "${servicesService.first_name} ${servicesService.last_name}";
    isLoading(false);
  }

  void getRateAndReviewsByServiceId() async {
    isLoading(true);

    final response = await servicesService
        .getRateAndReviewsByServiceId(arguments.services.id);

    if (response != null) {
      if (response['response']['state'] == 200) {
        RateAndReviewsWithUsersList.value = List<RateAndReviewsWithUsers>.from(
            response['response']['results']
                .map((x) => RateAndReviewsWithUsers.fromJson(x)));
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
