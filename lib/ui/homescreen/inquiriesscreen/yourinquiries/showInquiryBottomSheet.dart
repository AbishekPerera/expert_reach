// import 'package:expert_reach/constants/colors.dart';
// import 'package:flutter/material.dart';

// Future<dynamic> showViewInquiryDetailsBottomSheet(
//     BuildContext context, int index) {
//   return showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     isScrollControlled: true,
//     useSafeArea: true,
//     enableDrag: true,
//     showDragHandle: true,
//     constraints: BoxConstraints(
//       maxHeight: screenSize * 0.9,
//       minHeight: screenSize * 0.9,
//     ),
//     builder: (context) => Scrollbar(
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         primary: false,
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10,
//           ),
//           child: Column(
//             children: [
//               // Title
//               Row(
//                 children: [
//                   const Icon(Icons.payments_outlined),
//                   const SizedBox(width: 10),
//                   Text(
//                     "View Inquiry",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   //clear button
//                   const Spacer(),
//                   IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.delete_outlined,
//                         color: Colors.red,
//                       )),
//                 ],
//               ),
//               const SizedBox(height: 5),

//               // :::::::::::::::::::::::::::::::::::::::::::: Service Image ::::::::::::::::::::::::::::::
//               Container(
//                 width: double.infinity,
//                 // height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       "$userAdsURL${_yourInquiriesControllers.filterBusltList[index].services.image}",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black.withOpacity(0.8),
//                         Colors.black.withOpacity(0.1),
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ExpansionTile(
//                         iconColor: Colors.white,
//                         collapsedIconColor: Colors.white,
//                         title: Text(
//                           _yourInquiriesControllers
//                               .filterBusltList[index].services.title,
//                           style:
//                               Theme.of(context).textTheme.bodyLarge!.copyWith(
//                                     color: Colors.white,
//                                   ),
//                         ),
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               _yourInquiriesControllers
//                                   .filterBusltList[index].services.description,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(height: 10),

//               // :::::::::::::::::::::::::::::::::::::::::::: Service Details ::::::::::::::::::::::::::::::
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Colors.black26,
//                       offset: Offset(0, 5),
//                     )
//                   ],
//                 ),
//                 child: Material(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   child: InkWell(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                     onTap: () {},
//                     child: Ink(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: const LinearGradient(
//                           colors: [cPrimaryColor, cAccentColor],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Obx(
//                             () => Container(
//                               margin: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.white,
//                                 ),
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: CircleAvatar(
//                                 radius: 30,
//                                 backgroundImage: NetworkImage(
//                                   "$userImageURL${_yourInquiriesControllers.filterBusltList[index].users.profile_img}",
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Obx(
//                             () => Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     _yourInquiriesControllers
//                                             .filterBusltList[index]
//                                             .users
//                                             .first_name +
//                                         " " +
//                                         _yourInquiriesControllers
//                                             .filterBusltList[index]
//                                             .users
//                                             .last_name,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall,
//                                     textAlign: TextAlign.start,
//                                   ),
//                                   Text(
//                                     _yourInquiriesControllers
//                                         .filterBusltList[index].services.title,
//                                     style:
//                                         Theme.of(context).textTheme.bodySmall,
//                                     textAlign: TextAlign.start,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const Spacer(),

//                           //price
//                           Container(
//                             padding: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.money,
//                                   color: Colors.yellow,
//                                 ),
//                                 Obx(
//                                   () => Text(
//                                     " ${_yourInquiriesControllers.filterBusltList[index].services.rates}/=",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(
//                                           color: Colors.white,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 10),

//               // :::::::::::::::::::::::::::::::::::::::::::: Location ::::::::::::::::::::::::::::::
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Colors.black26,
//                       offset: Offset(0, 5),
//                     )
//                   ],
//                   gradient: LinearGradient(
//                     colors: [cPrimaryColor, cAccentColor],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                         margin: const EdgeInsets.all(10),
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.location_on_outlined,
//                             color: Colors.green,
//                           ),
//                         )),

//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             _yourInquiriesControllers
//                                 .filterBusltList[index].locations.name,
//                             style: Theme.of(context).textTheme.headlineSmall,
//                             textAlign: TextAlign.start,
//                           ),
//                         ],
//                       ),
//                     ),

//                     const Spacer(),

//                     //price
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.access_time,
//                             color: Colors.yellow,
//                           ),
//                           Obx(
//                             () => Text(
//                               " ${_yourInquiriesControllers.filterBusltList[index].times.time}",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                     color: Colors.white,
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // :::::::::::::::::::::::::::::::::::::::::::: Notes ::::::::::::::::::::::::::::::
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 10),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Colors.black26,
//                       offset: Offset(0, 5),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Notes",
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             color: cPrimaryColor,
//                           ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       _yourInquiriesControllers
//                           .filterBusltList[index].bookings.notes,
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                   ],
//                 ),
//               ),

//               // :::::::::::::::::::::::::::::::::::::::::::: Cancel ::::::::::::::::::::::::::::::
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 10),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Colors.black26,
//                       offset: Offset(0, 5),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Cancel",
//                       style:
//                           Theme.of(context).textTheme.headlineSmall!.copyWith(
//                                 color: Colors.red,
//                               ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "You can cancel your inquiry before Approval.",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall!
//                           .copyWith(color: Colors.red),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Cancel Inquiry",
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: Colors.white,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
