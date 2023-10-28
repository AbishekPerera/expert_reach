import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/home_screen/findscreen/findscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FindScreen extends StatelessWidget {
  FindScreen({super.key});

  final FindScreenController findScreenController =
      Get.put(FindScreenController());

  final List<String> rating = ["All", "1.0", "2.0", "3.0", "4.0", "5.0"];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        findScreenController.getAllServices();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // :::::::::::::::::::::::::::::::::::::::::::: Search Bar ::::::::::::::::::::::::::::::

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                  controller: findScreenController.searchController,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        findScreenController.filterBySearch(
                            findScreenController.searchController.text);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    // focusColor: Colors.white,

                    // filled: true,
                    // fillColor: Colors.grey[800],
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                    floatingLabelStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cAccentColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    labelText: 'Search',
                  ),
                  onEditingComplete: () {
                    // print("searching");
                    findScreenController.filterBySearch(
                        findScreenController.searchController.text);
                  }),
            ),

            // :::::::::::::::::::::::::::::::::::::::::::: Filter ::::::::::::::::::::::::::::::

            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //districts in Sri Lanka
                    Expanded(
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                          value:
                              findScreenController.selectedLocation.value == ""
                                  ? null
                                  : findScreenController.selectedLocation.value,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Location';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                          ),
                          //location icon
                          icon: const Icon(
                            Icons.location_on,
                            color: cPrimaryColor,
                          ),
                          hint: Text(
                            'Select Location',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          items: findScreenController.locationsList
                              .map(
                                (district) => DropdownMenuItem(
                                  value: district.id,
                                  child: Text(
                                    district.name,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            findScreenController.selectedLocation.value =
                                value!;
                            findScreenController.filterByLocation(value);

                            // print(value);
                          },
                        ),
                      ),
                    ),
                    // filter rating
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Obx(
                        () => DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                          ),
                          //rating icon
                          icon: const Icon(
                            Icons.star_half_sharp,
                            color: cPrimaryColor,
                          ),
                          value: findScreenController.selectedRating.value == ""
                              ? null
                              : findScreenController.selectedRating.value,
                          items: rating
                              .map(
                                (rate) => DropdownMenuItem(
                                  value: rate,
                                  child: Text(
                                    rate,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              )
                              .toList(),

                          onChanged: (value) {
                            findScreenController.selectedRating.value = value!;
                            findScreenController.filterByRating(value);
                          },
                        ),
                      ),
                    ),
                  ],
                )),

            const SizedBox(
              height: 10,
            ),

            if (findScreenController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              Obx(
                () => ListView.builder(
                  itemCount: findScreenController.filteredServicesList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
                                arguments: findScreenController
                                    .filteredServicesList[index]);
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
                                    "$userAdsURL${findScreenController.filteredServicesList[index].services.image}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          findScreenController
                                              .filteredServicesList[index]
                                              .services
                                              .title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: cPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Text(
                                                  "by ${findScreenController.filteredServicesList[index].users.first_name} ${findScreenController.filteredServicesList[index].users.last_name}",
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
                                              findScreenController
                                                  .filteredServicesList[index]
                                                  .services
                                                  .description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: //rating
                                              Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${findScreenController.filteredServicesList[index].services.rates} LKR",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                              RatingBar.builder(
                                                itemSize: 15,
                                                initialRating: double.parse(
                                                    findScreenController
                                                        .filteredServicesList[
                                                            index]
                                                        .stars),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
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
              ),

            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
