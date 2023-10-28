

                // Obx(
                //   () => _addInquiryController.isLoading.value == false
                //       ? Row(
                //           children: [
                //             Expanded(
                //               child: Container(
                //                 margin:
                //                     const EdgeInsets.symmetric(horizontal: 10),
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
                //                 child: DropdownButtonFormField<AvailableTime>(
                //                   decoration: InputDecoration(
                //                     border: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(10),
                //                     ),
                //                     contentPadding: const EdgeInsets.symmetric(
                //                         horizontal: 10, vertical: 5),
                //                   ),
                //                   items: [
                //                     for (var item
                //                         in _addInquiryController.times)
                //                       DropdownMenuItem(
                //                         value: item,
                //                         child: Text(
                //                           item.time,
                //                           style: Theme.of(context)
                //                               .textTheme
                //                               .bodySmall,
                //                         ),
                //                       ),
                //                   ],
                //                   onChanged: (value) {
                //                     _addInquiryController.addTimes(value!);
                //                   },
                //                 ),
                //               ),
                //             ),
                //           ],
                //         )
                //       : const LinearProgressIndicator(),
                // ),