import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:phlox_animations/phlox_animations.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List<Map> _dashboardItems = [
    {
      "title": "New inquiry",
      "subtitle": "this is a subtitle",
      "image": notification,
    },
    {
      "title": "Request accepted",
      "subtitle": "this is a subtitle",
      "image": notification,
    },
    {
      "title": "New inquiry",
      "subtitle": "this is a subtitle",
      "image": notification,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: _dashboardItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: PhloxAnimations(
                      duration: const Duration(milliseconds: 200),
                      fromScale: 0.5,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.15,
                          motion: const ScrollMotion(),
                          children: [
                            //delete icon button
                            SlidableAction(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              onPressed: (context) {},
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(1, 59, 109, 1),
                                Color.fromRGBO(1, 123, 229, 1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ListTile(
                                leading: Image.asset(
                                  _dashboardItems[index]["image"],
                                  height: 50,
                                  width: 50,
                                ),
                                title: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(1, 123, 229, 1),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Text(_dashboardItems[index]["title"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )),
                                ),
                                subtitle: Text(
                                  _dashboardItems[index]["subtitle"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
