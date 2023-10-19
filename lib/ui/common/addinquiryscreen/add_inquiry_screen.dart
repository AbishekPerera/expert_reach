import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/common/addinquiryscreen/add_inquiry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddInquiryScreen extends StatelessWidget {
  AddInquiryScreen({super.key});

  final AddInquiryController _addInquiryController =
      Get.put(AddInquiryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 98, 155, 1),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          "Expert Reach",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // cover image
            Container(
              width: double.infinity,
              child: Image.asset(
                addbookingbanner,
                fit: BoxFit.contain,
              ),
            ),

            // :::::::::::::::::::::::::::::::::::::::::::: SP Profile card ::::::::::::::::::::::::::::::
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              ),
              child: Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [cPrimaryColor, cAccentColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                              "$userImageURL${_addInquiryController.arguments.users.profile_img}",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_addInquiryController.arguments.users.first_name} ${_addInquiryController.arguments.users.last_name}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "${_addInquiryController.arguments.services.title}",
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),

                        //rating
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                "${_addInquiryController.arguments.stars}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const Divider(
              color: Colors.white,
            ),

            // :::::::::::::::::::::::::::::::::::::::::::: Inquiry Form ::::::::::::::::::::::::::::::

            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Booking Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                )),

            const Divider(
              color: Colors.white,
            ),

            Form(
                key: _addInquiryController.addbooking,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // date picker
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Select Date",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.start,
                        )),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      child: SfDateRangePicker(
                        view: DateRangePickerView.month,
                        selectionMode: DateRangePickerSelectionMode.single,
                        onSelectionChanged: (DateRangePickerSelectionChangedArgs
                            dateRangePickerSelectionChangedArgs) {
                          //set selected date
                          _addInquiryController.selectedDate.value =
                              dateRangePickerSelectionChangedArgs.value;

                          //get times
                          _addInquiryController.getTimes();
                        },
                        todayHighlightColor: cPrimaryColor,
                        headerStyle: DateRangePickerHeaderStyle(
                          textAlign: TextAlign.center,
                          textStyle: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),

                    // time dropdown
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Time",
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "( Select multiple times if you want to book for multiple hours. Pending times are grayed out )",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )),

                    //show times as grid
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => _addInquiryController.times.length > 0
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _addInquiryController.times.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      _addInquiryController.addTimes(
                                          _addInquiryController.times[index]);
                                    },
                                    child: Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: _addInquiryController
                                                  .selectedTimes
                                                  .contains(
                                                      _addInquiryController
                                                          .times[index])
                                              ? Colors.green
                                              : _addInquiryController
                                                          .times[index]
                                                          .status ==
                                                      "Pending"
                                                  ? Colors.grey
                                                  : Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.black26,
                                              offset: Offset(0, 5),
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            _addInquiryController
                                                .times[index].time
                                                .toString()
                                                .substring(0, 9),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: _addInquiryController
                                                          .selectedTimes
                                                          .contains(
                                                              _addInquiryController
                                                                  .times[index])
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const SizedBox(),
                      ),
                    ),

                    // show message if no times available
                    Obx(
                      () => _addInquiryController.selectedTimes.length == 0 &&
                              _addInquiryController.isLoading.value == false
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "*No times available for this date",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                            )
                          : const SizedBox(),
                    ),

                    // note
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Add Note",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.start,
                        )),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      child: TextFormField(
                        controller: _addInquiryController.notesController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                        ),
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a note";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _addInquiryController.notes = value!;
                        },
                      ),
                    ),

                    // confirm terms and conditions
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text("I agree to the terms and conditions",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    )),
                      ],
                    ),

                    // send button
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          _addInquiryController.addBooking();
                        },
                        child: const Text("Send"),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
