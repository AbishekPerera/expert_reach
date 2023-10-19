import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/models/data_classes/services__locations__users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SuggestedForYouWidget extends StatelessWidget {
  const SuggestedForYouWidget({
    super.key,
    required RxList<ServicesWithLocationsWithUsers> dashboardItems,
  }) : _dashboardItems = dashboardItems;

  final RxList<ServicesWithLocationsWithUsers> _dashboardItems;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _dashboardItems.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed("/view-post-screen",
                      arguments: _dashboardItems[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          "$userAdsURL${_dashboardItems[index].services.image}",
                          height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                _dashboardItems[index].services.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: cPrimaryColor,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text(
                                        "by ${_dashboardItems[index].users.first_name} ${_dashboardItems[index].users.last_name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 11)),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    _dashboardItems[index].services.description,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: //rating
                                    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${_dashboardItems[index].services.rates} LKR",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: double.parse(
                                          _dashboardItems[index].stars),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
