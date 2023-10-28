import 'dart:io';

import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/controllers/common/viewandeditpostscreen/editservicescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditServiceScreen extends StatelessWidget {
  EditServiceScreen({super.key});

  final EditServiceScreenController editServiceScreenController =
      Get.put(EditServiceScreenController());

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
        actions: [
          //delete
          IconButton(
            onPressed: () {
              // editServiceScreenController.deleteService();
              //ask for confirmation
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete Service"),
                    content: const Text(
                        "Are you sure you want to delete this service?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          editServiceScreenController.deleteService();
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                child: Text('Edit Your Service',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              const SizedBox(height: 10),

              // Add Service Form
              Form(
                  key: editServiceScreenController.editServiceFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    TextFormField(
                      controller:
                          editServiceScreenController.serviceTitleController,
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
                        editServiceScreenController.serviceTitle = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: editServiceScreenController
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
                        editServiceScreenController.serviceDescription = value!;
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
                              value: editServiceScreenController
                                  .selectedLocation.value,
                              items: editServiceScreenController.locationsList
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
                                editServiceScreenController
                                    .selectedLocation.value = value!;

                                // print(value);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: editServiceScreenController
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
                              editServiceScreenController.servicePrice = value!;
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
                        child: editServiceScreenController
                                    .selectedImagePath.value !=
                                ""
                            ? Image.file(
                                File(editServiceScreenController
                                    .selectedImagePath.value),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                userAdsURL +
                                    editServiceScreenController
                                        .arguments.services.image,
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
                          editServiceScreenController.getImage(
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
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: editServiceScreenController.isLoading.value
                            ? LinearProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  editServiceScreenController.validate();
                                },
                                child: Text('Update Service'),
                              ),
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
