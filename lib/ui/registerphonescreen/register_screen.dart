import 'dart:io';

import 'package:expert_reach/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/registerphone_screen/register_phone_controller.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final screenSize = Get.size;

  final RegisterPhoneController registerPhoneController =
      Get.put(RegisterPhoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: screenSize.height * 0.20,
                  alignment: Alignment.center,
                  child: const Center(
                    child: Image(
                      image: AssetImage(LogoPng),
                    ),
                  )),
              Text("Get Connected:",
                  style: Theme.of(context).textTheme.displayLarge),
              Text(
                "Your Journey to Expertise Begins Here",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: screenSize.height * 0.02),

              // :::::::::::::::::::::::::::::::::::::::::::::::: FORM

              Form(
                key: registerPhoneController.registerPhoneFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile image
                    Center(
                      child: Obx(
                        () => CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              registerPhoneController.selectedImagePath.value ==
                                      ""
                                  ? const AssetImage(default_profile)
                                  : Image.file(File(registerPhoneController
                                          .selectedImagePath.value))
                                      .image,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: cPrimaryColor,
                              child: IconButton(
                                onPressed: () {
                                  registerPhoneController
                                      .getImage(ImageSource.gallery);
                                },
                                icon: Icon(
                                  size: 15,
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "First Name",
                              hintText: "Enter your first name",
                              border: OutlineInputBorder(),
                            ),
                            controller:
                                registerPhoneController.firstNameController,
                            onSaved: (value) {
                              registerPhoneController.firstName = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name is required";
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "Last Name",
                              hintText: "Enter your last name",
                              border: OutlineInputBorder(),
                            ),
                            controller:
                                registerPhoneController.lastNameController,
                            onSaved: (value) {
                              registerPhoneController.lastName = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name is required";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                      controller: registerPhoneController.emailController,
                      onSaved: (value) {
                        registerPhoneController.email = value!;
                      },
                      validator: (value) {
                        if (!value!.isEmail) {
                          return "Please enter a valid email";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone",
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      controller: registerPhoneController.phoneController,
                      onSaved: (value) {
                        registerPhoneController.phone = value!;
                      },
                      validator: (value) {
                        if (value!.length < 10) {
                          return "Phone number is required";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: registerPhoneController.obscureText.value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            hintText: "Enter your password",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerPhoneController.obscureText.value =
                                      !registerPhoneController
                                          .obscureText.value;
                                },
                                icon: Icon(
                                    registerPhoneController.obscureText.value ==
                                            true
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                        controller: registerPhoneController.passwordController,
                        onSaved: (value) {
                          registerPhoneController.password = value!;
                        },
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password must be of 8 chars";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: registerPhoneController.obscureText.value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Confirm Password",
                            hintText: "Confirm your password",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerPhoneController.obscureText.value =
                                      !registerPhoneController
                                          .obscureText.value;
                                },
                                icon: Icon(
                                    registerPhoneController.obscureText.value ==
                                            true
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                        controller:
                            registerPhoneController.confirmPasswordController,
                        onSaved: (value) {
                          registerPhoneController.confirmPassword = value!;
                        },
                        validator: (value) {
                          if (value !=
                              registerPhoneController
                                  .passwordController!.text) {
                            return "Password does not match";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: registerPhoneController.isLoading.value == true
                            ? const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: LinearProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  registerPhoneController
                                      .validateRegisterPhoneForm();
                                },
                                child: const Text("REGISTER"),
                              ),
                      ),
                    ),
                    // :::::::::::::::::::::::::::::::::::::::::::::::: or Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: cPrimaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
