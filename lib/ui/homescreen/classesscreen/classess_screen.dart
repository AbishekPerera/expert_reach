import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';

class ClassessScreen extends StatelessWidget {
  ClassessScreen({super.key});

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

  final double screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // :::::::::::::::::::::::::::::::::::::::::::: Search bar ::::::::::::::::::::::::::::::
        Container(
          margin: EdgeInsets.all(10),
          height: Get.height * 0.21,
          width: double.infinity,
          decoration: BoxDecoration(
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
          child: Container(
            width: Get.width * 0.5,
            height: Get.height * 0.2,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Abishek!",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's learn something today",
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            // controller: parentController.searchController,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              // focusColor: Colors.white,

                              filled: true,
                              fillColor: cPrimaryColor,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                              floatingLabelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              labelText: 'Search',
                            ),
                            onEditingComplete: () {
                              print("searching");
                            })),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // :::::::::::::::::::::::::::::::::::::::::::: Search bar ::::::::::::::::::::::::::::::

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Your Classes",
              style: Theme.of(context).textTheme.displaySmall),
        ),

        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: _dashboardItems.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        // dashboardController.goToQickLinks(index);
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
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
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
        ),
      ],
    );
  }
}
