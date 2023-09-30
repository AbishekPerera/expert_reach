import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CustomerInquiriesWidget extends StatelessWidget {
  CustomerInquiriesWidget({super.key});

  final List<Map> _dashboardItems = [
    {
      "title": "Italian classes",
      "booked_time": "12.30pm - 1.30pm",
      'location': "Baththaramulla",
      "created_time": "22-08-23 12:30",
      "status": "Approved",
      "image": maleTeacher,
    },
    {
      "title": "Italian classes",
      "booked_time": "1.30pm - 2.30pm",
      "location": "Colombo",
      "created_time": "22-08-23 12:30",
      "status": "Rejected",
      "image": femaleTeacher,
    },
    {
      "title": "Italian classes",
      "booked_time": "2.30pm - 3.30pm",
      "location": "Kandy",
      "created_time": "22-08-23 12:30",
      "status": "Pending",
      "image": profile,
    },
    {
      "title": "Italian classes",
      "booked_time": "3.30pm - 4.30pm",
      "location": "Galle",
      "created_time": "22-08-23 12:30",
      "status": "Approved",
      "image": maleTeacher,
    },
    {
      "title": "Italian classes",
      "booked_time": "4.30pm - 5.30pm",
      "location": "Kandy",
      "created_time": "22-08-23 12:30",
      "status": "Rejected",
      "image": femaleTeacher,
    },
    {
      "title": "Italian classes",
      "booked_time": "5.30pm - 6.30pm",
      "location": "Colombo",
      "created_time": "22-08-23 12:30",
      "status": "Pending",
      "image": profile,
    }
  ];

  final List<String> status = ["All", "Approved", "Rejected", "Pending"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // :::::::::::::::::::::::::::::::::::::::::::: Filter ::::::::::::::::::::::::::::::
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 200,
                      child: Text(
                        "Your customer inquiries are listed here",
                        style: Theme.of(context).textTheme.labelSmall,
                      )),
                  const Spacer(),
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField(
                      value: "All",
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
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              )),

          ListView.builder(
            itemCount: _dashboardItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          _dashboardItems[index]["image"],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _dashboardItems[index]["title"],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Text(
                                  _dashboardItems[index]["location"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                            Text(
                              _dashboardItems[index]["booked_time"],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 10),
                            ),

                            // :::::::::::::::::::::::::::::::::::::::::::: Status ::::::::::::::::::::::::::::::
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: getStatusColor(
                                            _dashboardItems[index]["status"]),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _dashboardItems[index]["status"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: getStatusColor(
                                                    _dashboardItems[index]
                                                        ["status"]),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                        ),
                                        Icon(
                                          getStatusIcon(
                                              _dashboardItems[index]["status"]),
                                          color: getStatusColor(
                                              _dashboardItems[index]["status"]),
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
              );
            },
          ),

          const SizedBox(
            height: 20,
          )
        ],
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