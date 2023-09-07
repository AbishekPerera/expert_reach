import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/home_screen/dashboardscreen/dashboard_controller.dart';
import 'package:expert_reach/ui/homescreen/dashboardscreen/customcarousel_slider.dart';

class Dashboard extends StatelessWidget {
  final List<Map> _dashboardItems = [
    {
      "title": "Link 1",
      "image": attendance,
    },
    {
      "title": "Link 2",
      "image": onlineexam,
    },
    {
      "title": "Download Center",
      "image": downloadcenter,
    },
    {
      "title": "Reports",
      "image": reports,
    },
  ];

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // :::::::::::::::::::::::::::::::::::::::::::: Profile Card ::::::::::::::::::::::::::::::
          InkWell(
            onTap: () {
              dashboardController.goToQickLinks(8);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Color.fromRGBO(205, 0, 65, 1),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cPrimaryColor, cAccentColor],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.2,
                    margin: EdgeInsets.all(15),
                    child: CircleAvatar(
                      backgroundImage: Image.asset(profile).image,
                    ),
                  ),
                  Obx(
                    () => Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.2,
                      margin: const EdgeInsets.all(10),
                      child: dashboardController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${dashboardController.name.value} ${dashboardController.surname.value}",
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dashboardController.employeeId.value,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // :::::::::::::::::::::::::::::::::::::::::::: dashboard body ::::::::::::::::::::::::::::::

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Popular Courses",
                style: Theme.of(context).textTheme.displaySmall),
          ),

          const CustomCarouselSlider(),

          // :::::::::::::::::::::::::::::::::::::::::::: Quick Links ::::::::::::::::::::::::::::::

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Quick Links",
                style: Theme.of(context).textTheme.displaySmall),
          ),

          Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: _dashboardItems.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        dashboardController.goToQickLinks(index);
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Colors.grey[800]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.17,
                                  height: screenWidth * 0.17,
                                  child: Image.asset(
                                    _dashboardItems[index]["image"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  _dashboardItems[index]["title"],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            )),
                      ),
                    );
                  })),

          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
