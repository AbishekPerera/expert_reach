import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestedForYouWidget extends StatelessWidget {
  const SuggestedForYouWidget({
    super.key,
    required List<Map> dashboardItems,
  }) : _dashboardItems = dashboardItems;

  final List<Map> _dashboardItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Get.toNamed("/view-post-screen");
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
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
            ),
          ),
        );
      },
    );
  }
}
