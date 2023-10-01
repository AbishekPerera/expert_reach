import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/home_screen/profilescreen/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  final List<Map> _dashboardItems = [
    {
      "title": "Italian classes",
      "subtitle": "this is a subtitle",
      "image": adults1,
    },
    {
      "title": "English classes",
      "subtitle": "this is a subtitle",
      "image": adults2,
    },
    {
      "title": "Italian classes",
      "subtitle": "this is a subtitle",
      "image": avventura,
    },
    {
      "title": "English classes",
      "subtitle": "this is a subtitle",
      "image": interaction,
    },
    {
      "title": "Italian classes",
      "subtitle": "this is a subtitle",
      "image": maestri,
    },
    {
      "title": "English classes",
      "subtitle": "this is a subtitle",
      "image": primipassi,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screen_width = Get.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: screen_width * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: cPrimaryColor,
                // image: DecorationImage(
                //     image: AssetImage(italianFlag),
                //     fit: BoxFit.cover,
                //     opacity: 0.9,
                //     alignment: Alignment.topCenter),
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            child: Stack(
              children: [
                Obx(
                  () => Positioned(
                    top: 10,
                    left: screen_width * 0.33,
                    child: Container(
                      width: screen_width * 0.30,
                      height: screen_width * 0.30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(255, 172, 171, 171),
                          width: 5.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: profileController.profilePic.value
                                        .toString() ==
                                    "null" ||
                                profileController.profilePic.value.toString() ==
                                    ""
                            ? Image.asset(
                                profile,
                                fit: BoxFit.cover,
                              ).image
                            : NetworkImage(
                                "$userImageURL${profileController.profilePic.value}"),
                      ),
                    ),
                  ),
                ),

                //pro badge
                Positioned(
                  top: 100,
                  left: screen_width * 0.55,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 124, 4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),

                //logout button
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      profileController.logout();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: Obx(
                        () => ListTile(
                          leading: const Icon(
                            Icons.person_outline_outlined,
                            size: 40,
                          ),
                          title: Text(
                            "Name",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          subtitle: profileController.isLoading.value == true
                              ? const LinearProgressIndicator()
                              : Text(
                                  "${profileController.firstName.value} ${profileController.lastName.value}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: Obx(() => ListTile(
                            leading: const Icon(
                              Icons.email_outlined,
                              size: 40,
                            ),
                            title: Text(
                              "Email",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: profileController.isLoading.value == true
                                ? const LinearProgressIndicator()
                                : Text(
                                    profileController.email.value,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                          )),
                    ),
                    const Divider(),
                    Material(
                        color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        elevation: 2,
                        child: Obx(
                          () => ListTile(
                            leading: const Icon(
                              Icons.contact_phone_outlined,
                              size: 40,
                            ),
                            title: Text(
                              "Phone",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: profileController.isLoading.value == true
                                ? const LinearProgressIndicator()
                                : Text(
                                    profileController.phone.value,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                          ),
                        )),
                  ]),
            ),
          ),

          Divider(
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your services",
                    style: Theme.of(context).textTheme.displaySmall),

                //add service button
                OutlinedButton(
                    onPressed: () {
                      Get.toNamed("/add-service");
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          "Add service",
                        )
                      ],
                    )),
              ],
            ),
          ),

          ListView.builder(
            itemCount: _dashboardItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        _dashboardItems[index]["image"],
                        height: 100,
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
                            Text(
                              _dashboardItems[index]["title"],
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              _dashboardItems[index]["subtitle"],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //edit icon
                                    Material(
                                      color: Colors.white,
                                      type: MaterialType.transparency,
                                      child: IconButton(
                                        splashRadius: 20,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.mode_edit_outlined,
                                          color: cPrimaryColor,
                                        ),
                                      ),
                                    ),

                                    //delete icon
                                    // Material(
                                    //   color: Colors.white,
                                    //   type: MaterialType.transparency,
                                    //   child: IconButton(
                                    //     splashRadius: 20,
                                    //     onPressed: () {},
                                    //     icon: const Icon(
                                    //       Icons.delete_outline_outlined,
                                    //       color: Colors.red,
                                    //     ),
                                    //   ),
                                    // ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // //logout button

          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   width: double.infinity,
          //   margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          //   decoration: BoxDecoration(
          //       color: Get.isDarkMode ? Colors.black : Colors.grey[200],
          //       borderRadius: BorderRadius.circular(10)),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 20),
          //     child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           //Admin details
          //           Text("Logout",
          //               style: Theme.of(context).textTheme.displaySmall),

          //           const SizedBox(height: 10),

          //           Material(
          //             color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
          //             shape: const RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(10))),
          //             elevation: 2,
          //             child: ListTile(
          //               onTap: () {},
          //               leading: const Icon(
          //                 Icons.logout,
          //                 size: 40,
          //               ),
          //               title: Text(
          //                 "Logout",
          //                 style: Theme.of(context).textTheme.titleMedium,
          //               ),
          //               subtitle: Text(
          //                 "Session expires on 2023",
          //                 style: Theme.of(context).textTheme.titleSmall,
          //               ),
          //             ),
          //           ),
          //         ]),
          //   ),
          // ),

          SizedBox(height: screen_width * 0.02),
        ],
      ),
    );
  }
}
