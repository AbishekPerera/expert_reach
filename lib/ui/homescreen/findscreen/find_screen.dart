import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';

class FindScreen extends StatelessWidget {
  FindScreen({super.key});

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

  final List<String> districtNames = [
    "All",
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    'Puttalam',
    "Ratnapura",
    "Trincomalee",
    "Vavuniya"
  ];

  final List<String> rating = ["All", "1.0", "2.0", "3.0", "4.0", "5.0"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // :::::::::::::::::::::::::::::::::::::::::::: Search Bar ::::::::::::::::::::::::::::::

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
                // controller: parentController.searchController,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  // focusColor: Colors.white,

                  // filled: true,
                  // fillColor: Colors.grey[800],
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                  floatingLabelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cPrimaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cAccentColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Search',
                ),
                onEditingComplete: () {
                  print("searching");
                }),
          ),

          // :::::::::::::::::::::::::::::::::::::::::::: Filter ::::::::::::::::::::::::::::::

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //districts in Sri Lanka
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                      ),
                      //location icon
                      icon: const Icon(
                        Icons.location_on,
                        color: cPrimaryColor,
                      ),
                      value: "All",
                      items: districtNames
                          .map(
                            (district) => DropdownMenuItem(
                              value: district,
                              child: Text(
                                district,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  // filter rating
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                      ),
                      //rating icon
                      icon: const Icon(
                        Icons.star_half_sharp,
                        color: cPrimaryColor,
                      ),
                      value: "All",
                      items: rating
                          .map(
                            (rate) => DropdownMenuItem(
                              value: rate,
                              child: Text(
                                rate,
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

          const SizedBox(
            height: 10,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "4.5",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.grey),
                                    ),
                                    //star icon
                                    const Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                    ),
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

          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
