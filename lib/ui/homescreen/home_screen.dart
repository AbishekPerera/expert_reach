import 'package:expert_reach/ui/homescreen/findscreen/find_screen.dart';
import 'package:expert_reach/ui/homescreen/inquiriesscreen/inquiries_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/home_screen/home_controller.dart';
import 'package:expert_reach/ui/homescreen/dashboardscreen/dashboard_screen.dart';
import 'package:expert_reach/ui/homescreen/profilescreen/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  final screens = [
    Dashboard(),
    FindScreen(),
    InquiriesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 60,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Text(
            "Expert Reach",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/notifications");
              },
              icon: const Icon(Icons.notifications),
            )
          ],
          centerTitle: true,
        ),
        body: Obx(() => screens[homeController.selectedIndex.value]),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => GNav(
                gap: 3,
                backgroundColor:
                    Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
                color: cWhiteColor,
                activeColor: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
                tabBackgroundColor: Get.isDarkMode ? cgray : cWhiteColor,
                padding: const EdgeInsets.all(15.0),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Find',
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GButton(
                    icon: Icons.message,
                    text: 'Inquiries',
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ],
                selectedIndex: homeController.selectedIndex.value,
                onTabChange: (index) {
                  homeController.changeIndex(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return showDialog(
      context: Get.overlayContext ?? Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          "Confirm exit",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        content: Text(
          "Are you sure you want to exit the app?",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "No",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Yes",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: cPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
