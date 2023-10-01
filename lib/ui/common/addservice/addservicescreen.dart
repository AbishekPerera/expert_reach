import 'dart:io';

import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/common/addservicescreen/addservicescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({super.key});

  final AddServiceScreenController addServiceScreenController =
      Get.put(AddServiceScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                child: Text('Add Your Service',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              const SizedBox(height: 10),

              // Add Service Form
              Form(
                  key: addServiceScreenController.addServiceFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    TextFormField(
                      controller:
                          addServiceScreenController.serviceTitleController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.text_fields_outlined,
                          color: cPrimaryColor,
                        ),
                        labelText: 'Service Title',
                        hintText: 'Enter Service Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Service Title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addServiceScreenController.serviceTitle = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: addServiceScreenController
                          .serviceDescriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Service Description',
                        hintText: 'Enter Service Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Service Description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addServiceScreenController.serviceDescription = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select Location';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 18,
                                ),
                              ),
                              //location icon
                              icon: const Icon(
                                Icons.location_on,
                                color: cPrimaryColor,
                              ),
                              hint: Text(
                                'Select Location',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              items: addServiceScreenController.locationsList
                                  .map(
                                    (district) => DropdownMenuItem(
                                      value: district.id,
                                      child: Text(
                                        district.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                addServiceScreenController
                                    .selectedLocation.value = value!;

                                // print(value);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: addServiceScreenController
                                .servicePriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                child: Text('LKR',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          color: cPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                              ),
                              labelText: 'Hourly Rate',
                              hintText: 'Enter Hourly Rate',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Hourly Rate';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              addServiceScreenController.servicePrice = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Preview Image
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: addServiceScreenController
                                    .selectedImagePath.value !=
                                ""
                            ? Image.file(
                                File(addServiceScreenController
                                    .selectedImagePath.value),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                underConstruction,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(),
                        onPressed: () {
                          addServiceScreenController.getImage(
                            ImageSource.gallery,
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons
                                .upload), // Replace 'Icons.upload' with the icon you want
                            SizedBox(
                                width:
                                    8), // Adjust the spacing between the icon and text
                            Text('Upload Image'),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    // terms and conditions
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text('I agree to the ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextButton(
                          onPressed: () {},
                          child: Text('Terms and Conditions',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: cPrimaryColor,
                                  )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: addServiceScreenController.isLoading.value
                          ? LinearProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                addServiceScreenController.validate();
                              },
                              child: Text('Add Service'),
                            ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
