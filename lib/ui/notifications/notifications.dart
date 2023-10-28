import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:phlox_animations/phlox_animations.dart';

import '../../controllers/notifications/notifications.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final NorificationController _Controller = Get.put(NorificationController());

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
        body: RefreshIndicator(
          onRefresh: () async {
            _Controller.getNotificationsByUserId();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => ListView.builder(
                    itemCount: _Controller.notificationList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
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
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  onPressed: (context) {
                                    _Controller.seenNotification(
                                        _Controller.notificationList[index]
                                            ["notification_id"]);
                                  },
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
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
                                      notification,
                                      height: 50,
                                      width: 50,
                                    ),
                                    title: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Color.fromRGBO(1, 123, 229, 1),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                          _Controller.notificationList[index]
                                              ["notification_title"],
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
                                      _Controller.notificationList[index]
                                          ["notification_description"],
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
                                      onPressed: () {
                                        _Controller.notificationList.removeAt(
                                            _Controller.notificationList
                                                .indexOf(_Controller
                                                    .notificationList[index]));
                                      },
                                      icon: const Icon(
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
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ));
  }
}
