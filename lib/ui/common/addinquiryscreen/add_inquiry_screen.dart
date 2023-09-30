import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddInquiryScreen extends StatelessWidget {
  AddInquiryScreen({super.key});

  final List<Map> _hoursList = [
    {
      "time": "08:00 AM",
    },
    {
      "time": "09:00 AM",
    },
    {
      "time": "10:00 AM",
    },
    {
      "time": "11:00 AM",
    },
    {
      "time": "12:00 PM",
    },
    {
      "time": "01:00 PM",
    },
    {
      "time": "02:00 PM",
    },
    {
      "time": "03:00 PM",
    },
    {
      "time": "04:00 PM",
    },
    {
      "time": "05:00 PM",
    },
    {
      "time": "06:00 PM",
    },
    {
      "time": "07:00 PM",
    },
    {
      "time": "08:00 PM",
    },
    {
      "time": "09:00 PM",
    }
  ];

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
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
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
                            backgroundImage: AssetImage(
                              maleTeacher,
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
                                "Ms. Janani Mayandi",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "English Teacher",
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),

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
                                "4.5",
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

            Divider(
              color: Colors.white,
            ),

            // :::::::::::::::::::::::::::::::::::::::::::: Inquiry Form ::::::::::::::::::::::::::::::

            // Form need to be added here
            // form should have the following fields
            // Date piker for date
            // time picker for time
            // add some note field

            // send button

            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Booking Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                )),

            Divider(
              color: Colors.white,
            ),

            Form(
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
                    boxShadow: [
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
                      print(dateRangePickerSelectionChangedArgs.value);
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
                    child: Text(
                      "Select Time",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    )),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                          ),
                          items: [
                            for (var item in _hoursList)
                              DropdownMenuItem(
                                child: Text(
                                  item["time"],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value: item["time"],
                              ),
                          ],
                          onChanged: (value) {},
                          value: "10:00 AM",
                        ),
                      ),
                    ),

                    // to
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "to",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                          ),
                          items: [
                            for (var item in _hoursList)
                              DropdownMenuItem(
                                child: Text(
                                  item["time"],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value: item["time"],
                              ),
                          ],
                          onChanged: (value) {},
                          value: "10:00 AM",
                        ),
                      ),
                    ),
                  ],
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
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                    ),
                    maxLines: 5,
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    onPressed: () {},
                    child: Text("Send"),
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
