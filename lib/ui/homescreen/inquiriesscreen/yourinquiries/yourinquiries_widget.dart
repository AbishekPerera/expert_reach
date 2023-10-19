import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/home_screen/inquiriesscreen/yourinquiries_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class YourInquiriesWidget extends StatelessWidget {
  YourInquiriesWidget({super.key});

  final YourInquiriesControllers _yourInquiriesControllers =
      Get.put(YourInquiriesControllers());

  final List<String> status = ["All", "Approved", "Rejected", "Pending"];

  final screenSize = Get.height;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _yourInquiriesControllers.getBookingsByUserId();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // :::::::::::::::::::::::::::::::::::::::::::: Filter ::::::::::::::::::::::::::::::
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: Text(
                          "Your requested inquiries are listed below",
                          style: Theme.of(context).textTheme.labelSmall,
                        )),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: Obx(
                        () => DropdownButtonFormField(
                          value: _yourInquiriesControllers.dropDownValue.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                          items: status
                              .map(
                                (state) => DropdownMenuItem(
                                  value: state,
                                  child: Text(
                                    state,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            _yourInquiriesControllers
                                .filterList(value.toString());
                          },
                        ),
                      ),
                    ),
                  ],
                )),

            Obx(
              () => _yourInquiriesControllers.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _yourInquiriesControllers.filterBusltList.isEmpty
                      ? const Center(
                          child: Text("No Inquiries Found"),
                        )
                      : ListView.builder(
                          itemCount:
                              _yourInquiriesControllers.filterBusltList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    // show bottom sheet
                                    showViewInquiryDetailsBottomSheet(
                                        context, index);
                                  },

                                  // :::::::::::::::::::::::::::::::::::::::::::::::::: Item ::::::::::::::::::::::::::::::::::::::::::::::::::
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.network(
                                          "$userAdsURL${_yourInquiriesControllers.filterBusltList[index].services.image}",
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _yourInquiriesControllers
                                                    .filterBusltList[index]
                                                    .services
                                                    .title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              Text(
                                                _yourInquiriesControllers
                                                    .filterBusltList[index]
                                                    .times
                                                    .time,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                              Text(
                                                "created on: ${_yourInquiriesControllers.filterBusltList[index].bookings.created_at.toString().substring(0, 10)}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),

                                              // :::::::::::::::::::::::::::::::::::::::::::: Status ::::::::::::::::::::::::::::::
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5,
                                                          vertical: 1),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.5,
                                                          color: getStatusColor(
                                                              _yourInquiriesControllers
                                                                  .filterBusltList[
                                                                      index]
                                                                  .bookings
                                                                  .status),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            _yourInquiriesControllers
                                                                .filterBusltList[
                                                                    index]
                                                                .bookings
                                                                .status,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                  color: getStatusColor(_yourInquiriesControllers
                                                                      .filterBusltList[
                                                                          index]
                                                                      .bookings
                                                                      .status),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                          Icon(
                                                            getStatusIcon(
                                                                _yourInquiriesControllers
                                                                    .filterBusltList[
                                                                        index]
                                                                    .bookings
                                                                    .status),
                                                            color: getStatusColor(
                                                                _yourInquiriesControllers
                                                                    .filterBusltList[
                                                                        index]
                                                                    .bookings
                                                                    .status),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
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

  // :::::::::::::::::::::::::::::::::::::::::::: Show View Inquiry Details Bottom Sheet ::::::::::::::::::::::::::::::

  Future<dynamic> showViewInquiryDetailsBottomSheet(
      BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      // constraints: BoxConstraints(
      //   maxHeight: screenSize * 0.9,
      //   minHeight: screenSize * 0.9,
      // ),
      builder: (context) => Scrollbar(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          primary: false,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                // Title
                Row(
                  children: [
                    const Icon(Icons.payments_outlined),
                    const SizedBox(width: 10),
                    Text(
                      "View Inquiry",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    //clear button
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.messenger_outline,
                          color: Colors.green,
                        )),
                  ],
                ),
                const SizedBox(height: 5),

                // :::::::::::::::::::::::::::::::::::::::::::: Service Image ::::::::::::::::::::::::::::::
                Container(
                  width: double.infinity,
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        "$userAdsURL${_yourInquiriesControllers.filterBusltList[index].services.image}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          title: Text(
                            _yourInquiriesControllers
                                .filterBusltList[index].services.title,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _yourInquiriesControllers.filterBusltList[index]
                                    .services.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // :::::::::::::::::::::::::::::::::::::::::::: Service Details ::::::::::::::::::::::::::::::
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [cPrimaryColor, cAccentColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  "$userImageURL${_yourInquiriesControllers.filterBusltList[index].users.profile_img}",
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_yourInquiriesControllers.filterBusltList[index].users.first_name} ${_yourInquiriesControllers.filterBusltList[index].users.last_name}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    _yourInquiriesControllers
                                        .filterBusltList[index].services.title,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),

                          //price
                          // Container(
                          //   padding: const EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       const Icon(
                          //         Icons.money,
                          //         color: Colors.yellow,
                          //       ),
                          //       Obx(
                          //         () => Text(
                          //           " ${_yourInquiriesControllers.filterBusltList[index].services.rates}/=",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodySmall!
                          //               .copyWith(
                          //                 color: Colors.white,
                          //               ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),

                      // contact details
                      _yourInquiriesControllers
                                  .filterBusltList[index].bookings.status !=
                              "Approved"
                          ? const SizedBox()
                          : Material(
                              type: MaterialType.transparency,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  // :::::::::::::::::::::::::::::::::::::::::::: Phone ::::::::::::::::::::::::::::::
                                  ListTile(
                                    onTap: () async {
                                      final call = Uri.parse(
                                          'tel:${_yourInquiriesControllers.filterBusltList[index].users.phone}');
                                      if (await canLaunchUrl(call)) {
                                        launchUrl(call);
                                      } else {
                                        throw 'Could not launch $call';
                                      }
                                    },
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.phone,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                    title: Obx(
                                      () => Text(
                                        " ${_yourInquiriesControllers.filterBusltList[index].users.phone}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    //send msg
                                    trailing: IconButton(
                                      onPressed: () async {
                                        final sms = Uri.parse(
                                            'sms:${_yourInquiriesControllers.filterBusltList[index].users.phone}');
                                        if (await canLaunchUrl(sms)) {
                                          launchUrl(sms);
                                        } else {
                                          throw 'Could not launch $sms';
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.message_outlined,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ),

                                  const Divider(
                                    color: Colors.white,
                                  ),

                                  // :::::::::::::::::::::::::::::::::::::::::::: Email ::::::::::::::::::::::::::::::

                                  ListTile(
                                      // border

                                      onTap: () async {
                                        final email = Uri.parse(
                                            'mailto:${_yourInquiriesControllers.filterBusltList[index].users.email}');
                                        if (await canLaunchUrl(email)) {
                                          launchUrl(email);
                                        } else {
                                          throw 'Could not launch $email';
                                        }
                                      },
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                      title: Obx(
                                        () => Text(
                                          " ${_yourInquiriesControllers.filterBusltList[index].users.email}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // :::::::::::::::::::::::::::::::::::::::::::: Location ::::::::::::::::::::::::::::::
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [cPrimaryColor, cAccentColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.green,
                                ),
                              )),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _yourInquiriesControllers
                                      .filterBusltList[index].locations.name,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          //price
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.yellow,
                                ),
                                Obx(
                                  () => Text(
                                    " ${_yourInquiriesControllers.filterBusltList[index].times.time}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        color: Colors.white,
                      ),

                      // price
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.money,
                              color: Colors.yellow,
                            ),
                            Obx(
                              () => Text(
                                " ${_yourInquiriesControllers.filterBusltList[index].services.rates}/=",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // :::::::::::::::::::::::::::::::::::::::::::: Notes ::::::::::::::::::::::::::::::
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notes",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: cPrimaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _yourInquiriesControllers
                            .filterBusltList[index].bookings.notes,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                // :::::::::::::::::::::::::::::::::::::::::::: Cancel ::::::::::::::::::::::::::::::
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cancel",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You can cancel your inquiry before Approval.",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _yourInquiriesControllers
                                  .filterBusltList[index].bookings.status ==
                              "Approved"
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Cancel Inquiry",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  // show dialog
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Cancel Inquiry",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                      content: Text(
                                        "Are you sure you want to cancel this inquiry?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "No",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.red,
                                                ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _yourInquiriesControllers
                                                .deleteBooking(
                                                    _yourInquiriesControllers
                                                        .filterBusltList[index]
                                                        .bookings
                                                        .id);
                                          },
                                          child: Text(
                                            "Yes",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.red,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  "Cancel Inquiry",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "Pending":
        return Colors.grey;
      default:
        return Colors.grey; // Default color for unknown statuses
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Approved":
        return Icons.check_circle_outline_outlined;
      case "Rejected":
        return Icons.cancel_outlined;
      case "Pending":
        return Icons.access_time_outlined;
      default:
        return Icons.error_outline; // Default icon for unknown statuses
    }
  }
}
