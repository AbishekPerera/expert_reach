import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/drawer/drawer_controller.dart';

import 'buildheader.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  final navigationDrawerController = Get.put(NavigationDrawerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 6,
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Dashboard",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Navigator.pop(context);
              // navigationDrawerController.goToDashboard();
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text("Classes",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Navigator.pop(context);
              // navigationDrawerController.goToClasses();
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text("My videos",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Navigator.pop(context);
              // navigationDrawerController.goToMyVideos();
            },
          ),
          const Divider(),
          //subscription
          ListTile(
            leading: const Icon(Icons.subscriptions),
            title: Text("Subscriptions",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Navigator.pop(context);
              // navigationDrawerController.goToSubscriptions();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title:
                Text("Profile", style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Navigator.pop(context);
              // navigationDrawerController.goToProfile();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_sharp),
            title:
                Text("Settings", style: Theme.of(context).textTheme.titleSmall),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: cPrimaryColor),
              ),
              onPressed: () {
                // loginController.logOut();
              },
              child: Text("Sign Out",
                  style: Get.isDarkMode
                      ? Theme.of(context).textTheme.titleSmall
                      : Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: cPrimaryColor)),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text("Report issue?"),
            ),
          ),
        ],
      ),
    );
  }
}
