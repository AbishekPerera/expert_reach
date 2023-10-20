import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/home_screen/profilescreen/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final screen_width = Get.width;

    return RefreshIndicator(
      onRefresh: () async {
        profileController.getUserData();
        profileController.getServicesByUserId();
        profileController.getSearchTermsByUserId();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
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
                                  profileController.profilePic.value
                                          .toString() ==
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                              subtitle:
                                  profileController.isLoading.value == true
                                      ? const LinearProgressIndicator()
                                      : Text(
                                          profileController.email.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                            )),
                      ),
                      const Divider(),
                      Material(
                          color:
                              Get.isDarkMode ? Colors.grey[800] : Colors.white,
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
                              subtitle:
                                  profileController.isLoading.value == true
                                      ? const LinearProgressIndicator()
                                      : Text(
                                          profileController.phone.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                            ),
                          )),
                      const Divider(),
                      Material(
                          color:
                              Get.isDarkMode ? Colors.grey[800] : Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 2,
                          child: Obx(
                              () => profileController.isLoading.value == true
                                  ? const LinearProgressIndicator()
                                  : SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: TextField(
                                              controller: profileController
                                                  .searchTermsController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Your Keywords",
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.keyboard_alt_outlined,
                                                  size: 40,
                                                  color: Colors.grey,
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    profileController
                                                        .addSearchTerms();
                                                  },
                                                  icon: const Icon(
                                                    Icons.update_outlined,
                                                    size: 26,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))),
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
                  InkWell(
                    onTap: () {
                      profileController.getServicesByUserId();
                    },
                    child: Text("Your services",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),

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

            //::::::::::::::::::::::::::::::::::::::: Services list  ::::::::::::::::::::::::::::::::
            Obx(
              () => ListView.builder(
                itemCount: profileController.servicesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.toNamed("/view-and-edit-post-screen",
                              arguments: profileController.servicesList[index]);
                        },
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
                              child: Image.network(
                                "$userAdsURL${profileController.servicesList[index].services.image}",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      profileController
                                          .servicesList[index].services.title,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 15,
                                              color: cPrimaryColor,
                                            ),
                                            Text(
                                              profileController
                                                  .servicesList[index]
                                                  .locations
                                                  .name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "\LKR: ${profileController.servicesList[index].services.rates}  ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //stars
                                            RatingBar.builder(
                                              initialRating: double.parse(
                                                  profileController
                                                      .servicesList[index]
                                                      .stars),
                                              itemSize: 15,
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
                                                // print(rating);
                                              },
                                            ),

                                            //edit icon
                                            Material(
                                              color: Colors.white,
                                              type: MaterialType.transparency,
                                              child: profileController
                                                          .servicesList[index]
                                                          .services
                                                          .is_active ==
                                                      "0"
                                                  ? const Icon(
                                                      Icons.access_time,
                                                      color: Colors.grey,
                                                    )
                                                  : const Icon(
                                                      Icons.done_all,
                                                      color: Colors.green,
                                                    ),
                                            ),
                                          ]),
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

            SizedBox(height: screen_width * 0.02),

            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 2,
                  child: Obx(
                    () => ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              //admin login dialog (form)
                              return AlertDialog(
                                title: const Text("Admin Login"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Form(
                                        key:
                                            profileController.adminloginFormKey,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .alternate_email_outlined),
                                                  labelText: "Email ",
                                                  hintText: "abc@domain.com",
                                                  border: OutlineInputBorder(),
                                                ),
                                                controller: profileController
                                                    .adminEmailController,
                                                onSaved: (value) {
                                                  profileController.userName =
                                                      value!;
                                                },
                                                validator: (value) {
                                                  if (!value!.isEmail) {
                                                    return "Please enter your email";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Obx(
                                                () => TextFormField(
                                                  decoration: InputDecoration(
                                                      prefixIcon: const Icon(Icons
                                                          .fingerprint_outlined),
                                                      labelText: "Password ",
                                                      hintText: "*********",
                                                      border:
                                                          const OutlineInputBorder(),
                                                      suffixIcon: IconButton(
                                                          onPressed: () {
                                                            profileController
                                                                .togglePassword();
                                                          },
                                                          icon: profileController
                                                                  .obscurePWText
                                                                  .value
                                                              ? const Icon(Icons
                                                                  .visibility_outlined)
                                                              : const Icon(Icons
                                                                  .visibility_off_outlined))),
                                                  obscureText: profileController
                                                      .obscurePWText.value,
                                                  controller: profileController
                                                      .adminPasswordController,
                                                  onSaved: (value) {
                                                    profileController.password =
                                                        value!;
                                                  },
                                                  validator: (value) {
                                                    if (value!.length < 6) {
                                                      return "Password must be at least 6 characters";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                      "Forget Password ?",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall)),
                                              Obx(
                                                () => SizedBox(
                                                    width: double.infinity,
                                                    child: profileController
                                                                .isLoading
                                                                .value ==
                                                            true
                                                        ? const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child:
                                                                LinearProgressIndicator(),
                                                          )
                                                        : ElevatedButton(
                                                            onPressed: () {
                                                              profileController
                                                                  .adminLogin();
                                                            },
                                                            child: const Text(
                                                                "SIGN IN"))),
                                              ),

                                              // :::::::::::::::::::::::::::::::::::::::::::::::: or Register
                                            ],
                                          ),
                                        )),
                                    // TextField(
                                    //   // controller: profileController
                                    //   //     .adminEmailController,
                                    //   decoration: const InputDecoration(
                                    //     hintText: "Email",
                                    //   ),
                                    // ),
                                    // TextField(
                                    //   // controller: profileController
                                    //   //     .adminPasswordController,
                                    //   decoration: const InputDecoration(
                                    //     hintText: "Password",
                                    //   ),
                                    // ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Cancel")),
                                ],
                              );
                            });
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      leading: const Icon(
                        Icons.admin_panel_settings_outlined,
                        size: 40,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                      title: Text(
                        "Are you a Admin?",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      subtitle: profileController.isLoading.value == true
                          ? const LinearProgressIndicator()
                          : Text(
                              "you can login as a admin",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                    ),
                  )),
            ),

            SizedBox(height: screen_width * 0.02),
          ],
        ),
      ),
    );
  }
}
