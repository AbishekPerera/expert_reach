import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/ui/common/suggestedforyouwidget/suggestedforyouwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/controllers/home_screen/dashboardscreen/dashboard_controller.dart';
import 'package:expert_reach/ui/homescreen/dashboardscreen/customcarousel_slider.dart';

class Dashboard extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // :::::::::::::::::::::::::::::::::::::::::::: Search Bar ::::::::::::::::::::::::::::::

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextField(
                // controller: parentController.searchController,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
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
                  print("searching");
                }),
          ),

          // :::::::::::::::::::::::::::::::::::::::::::: Carousel Slider ::::::::::::::::::::::::::::::

          const CustomCarouselSlider(),

          // :::::::::::::::::::::::::::::::::::::::::::: Suggested List ::::::::::::::::::::::::::::::

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text("Suggested for you",
                style: Theme.of(context).textTheme.displaySmall),
          ),

          const SizedBox(
            height: 10,
          ),

          SuggestedForYouWidget(
              dashboardItems: dashboardController.servicesList),

          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
