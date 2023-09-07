import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = Get.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: screen_width * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(italianFlag),
                    fit: BoxFit.cover,
                    opacity: 0.9,
                    alignment: Alignment.topCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Stack(
              children: [
                Positioned(
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
                      backgroundImage: const AssetImage(profile),
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
              ],
            ),
          ),
          SizedBox(height: screen_width * 0.05),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Admin details
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Student Details",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.person_outline_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Name",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "sunera abishek perera",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.email_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Email",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "abhishekperera77@gmail.com",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),

                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.contact_phone_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Phone",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "0701273992",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),

                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.badge_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Student ID",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "T001",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),

                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.date_range,
                          size: 40,
                        ),
                        title: Text(
                          "Date of Birth",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "1997-07-07",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),

                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.wc_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Gender",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "Male",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),

                    const Divider(),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on_outlined,
                          size: 40,
                        ),
                        title: Text(
                          "Address",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "No 10, Main Street, Colombo 10",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),

          SizedBox(height: screen_width * 0.05),

          //logout button

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Admin details
                    Text("Logout",
                        style: Theme.of(context).textTheme.displaySmall),

                    const SizedBox(height: 10),

                    Material(
                      color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.logout,
                          size: 40,
                        ),
                        title: Text(
                          "Logout",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "Session expires on 2023",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),

          SizedBox(height: screen_width * 0.02),
        ],
      ),
    );
  }
}
