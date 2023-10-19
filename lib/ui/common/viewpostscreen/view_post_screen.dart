import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/common/viewpostscreen/viewpostscreen_controller.dart';
import 'package:expert_reach/ui/common/suggestedforyouwidget/suggestedforyouwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ViewPostScreen extends StatelessWidget {
  ViewPostScreen({super.key});

  final ViewPostScreenController _viewPostScreenController =
      Get.put(ViewPostScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/add-inquiry-screen",
                arguments: _viewPostScreenController.arguments);
            // print(_viewPostScreenController.arguments.services.id +
            //     _viewPostScreenController.arguments.users.id);
          },
          backgroundColor: cPrimaryColor,
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: Obx(() {
          if (_viewPostScreenController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                _viewPostScreenController.getSuggestedServices();
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    flexibleSpace: Obx(
                      () => FlexibleSpaceBar(
                        title: Text(
                          _viewPostScreenController.title.value,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        background: Image.network(
                          "$userAdsURL${_viewPostScreenController.bannerImage.value}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // description
                  Obx(
                    () => SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _viewPostScreenController.description.value,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),

                  // accound details
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black26,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [cPrimaryColor, cAccentColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        "$userImageURL${_viewPostScreenController.profileImage.value}",
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _viewPostScreenController
                                              .serviceProviderName.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          _viewPostScreenController.title.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),

                                //rating
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Obx(
                                        () => Text(
                                          _viewPostScreenController.stars.value
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //service price
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: [cPrimaryColor, cAccentColor, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black26,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                          Obx(
                            () => Text(
                                "${_viewPostScreenController.price.value} /=",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                      child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text("Feedbacks",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 20,
                                )),

                        // feedbacks
                        Obx(
                          () => _viewPostScreenController
                                  .RateAndReviewsWithUsersList.isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("No Feedbacks",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  alignment: Alignment.topLeft,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _viewPostScreenController
                                        .RateAndReviewsWithUsersList.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(5),
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: cAccentColor),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.black26,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Obx(
                                              () => Container(
                                                margin: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                    "$userImageURL${_viewPostScreenController.RateAndReviewsWithUsersList[index].users.profile_img}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Obx(
                                                () => Column(
                                                  children: [
                                                    Text(
                                                      "${_viewPostScreenController.RateAndReviewsWithUsersList[index].users.first_name} ${_viewPostScreenController.RateAndReviewsWithUsersList[index].users.last_name}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                      child: Text(
                                                        _viewPostScreenController
                                                            .RateAndReviewsWithUsersList[
                                                                index]
                                                            .rateAndReviews
                                                            .feedback,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              fontSize: 10,
                                                            ),
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            //rating
                                            Obx(
                                              () => Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: RatingBar.builder(
                                                  itemSize: 15,
                                                  initialRating: double.parse(
                                                      _viewPostScreenController
                                                          .RateAndReviewsWithUsersList[
                                                              index]
                                                          .rateAndReviews
                                                          .stars),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ignoreGestures: true,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        )
                      ],
                    ),
                  )),

                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Suggest For You",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 20,
                                )),
                  )),
                  // suggestions
                  SliverToBoxAdapter(
                      child: SuggestedForYouWidget(
                          dashboardItems:
                              _viewPostScreenController.servicesLists)),
                ],
              ),
            );
          }
        }));
  }
}
