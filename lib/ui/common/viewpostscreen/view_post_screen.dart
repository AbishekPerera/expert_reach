import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/ui/common/suggestedforyouwidget/suggestedforyouwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ViewPostScreen extends StatelessWidget {
  ViewPostScreen({super.key});

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
      "image": adults1,
    },
    {
      "title": "English classes",
      "subtitle": "this is a subtitle",
      "image": adults2,
    }
  ];

  final List<Map> _feedbacks = [
    {
      "name": "Sunera Abishek",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": femaleTeacher,
    },
    {
      "name": "Lochani Perera",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": maleTeacher,
    },
    {
      "name": "Sunera Abishek",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": femaleTeacher,
    },
    {
      "name": "Lochani Perera",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": maleTeacher,
    },
    {
      "name": "Sunera Abishek",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": femaleTeacher,
    },
    {
      "name": "Lochani Perera",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": maleTeacher,
    },
    {
      "name": "Sunera Abishek",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": femaleTeacher,
    },
    {
      "name": "Lochani Perera",
      "subtitle":
          "Niyamai akki lassanata kiyala dunna hodatama theruna. akkith lassanai.",
      "image": maleTeacher,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add-inquiry-screen");
        },
        backgroundColor: cPrimaryColor,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "English Teacher",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              background: Image.asset(
                adults1,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // description
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl eu nisl.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),

          // accound details
          SliverToBoxAdapter(
            child: Container(
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
          ),

          SliverToBoxAdapter(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.grey,
                ),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black26,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Text("Feedbacks",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 20,
                        )),

                // feedbacks
                Container(
                  height: 200,
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _feedbacks.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  _feedbacks[index]["image"],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    _feedbacks[index]["name"],
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Text(
                                      _feedbacks[index]["subtitle"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 10,
                                          ),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //rating
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: RatingBar.builder(
                                itemSize: 15,
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),

          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Suggest For You",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 20,
                    )),
          )),
          // suggestions
          SliverToBoxAdapter(
              child: SuggestedForYouWidget(dashboardItems: _dashboardItems)),
        ],
      ),
    );
  }
}
