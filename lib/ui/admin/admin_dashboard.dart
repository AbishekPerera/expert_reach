import 'package:expert_reach/ui/admin/allservices/allservices_screen.dart';
import 'package:expert_reach/ui/admin/pendingservices/pendingservices_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 123, 218, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          "Expert Reach Admin",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(Icons.logout),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(children: [
          TabBar(
            tabs: [
              Tab(
                child: Text(
                  "All Services",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Pending Services",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [AllServicesScreen(), PendingServicesScreen()],
            ),
          ),
        ]),
      ),
    );
  }
}
