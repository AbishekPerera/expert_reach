import 'package:expert_reach/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/registerphone_screen/register_phone_controller.dart';

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
              SizedBox(height: screenSize.height * 0.05),
              Text("Get Connected:",
                  style: Theme.of(context).textTheme.displayLarge),
              Text(
                "Your Journey to Expertise Begins Here",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: screenSize.height * 0.05),

              // :::::::::::::::::::::::::::::::::::::::::::::::: FORM

              Form(
                key: registerPhoneController.registerPhoneFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              // controller: registerPhoneController.firstNameController,
                              onSaved: (value) {
                                // registerPhoneController.firstName = value!;
                              },
                              validator: (value) {
                                // return registerPhoneController.validateFirstName(value!);
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
                              // controller: registerPhoneController.lastNameController,
                              onSaved: (value) {
                                // registerPhoneController.lastName = value!;
                              },
                              validator: (value) {
                                // return registerPhoneController.validateLastName(value!);
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
                        // controller: registerPhoneController.emailController,
                        onSaved: (value) {
                          // registerPhoneController.email = value!;
                        },
                        validator: (value) {
                          // return registerPhoneController.validateEmail(value!);
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
                        // controller: registerPhoneController.phoneController,
                        onSaved: (value) {
                          // registerPhoneController.phone = value!;
                        },
                        validator: (value) {
                          // return registerPhoneController.validatePhone(value!);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true, // Hide password text
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off_outlined),
                        ),
                        // controller: registerPhoneController.passwordController,
                        onSaved: (value) {
                          // registerPhoneController.password = value!;
                        },
                        validator: (value) {
                          // return registerPhoneController.validatePassword(value!);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       prefixIcon: const Icon(Icons.fingerprint_outlined),
                      //       labelText: "Password ",
                      //       hintText: "*********",
                      //       border: const OutlineInputBorder(),
                      //       suffixIcon: IconButton(
                      //           onPressed: () {
                      //             logincontroller.togglePassword();
                      //           },
                      //           icon: logincontroller.obscurePWText.value
                      //               ? const Icon(Icons.visibility_outlined)
                      //               : const Icon(
                      //                   Icons.visibility_off_outlined))),
                      //   obscureText: logincontroller.obscurePWText.value,
                      //   controller: logincontroller.passwordController,
                      //   onSaved: (value) {
                      //     logincontroller.password = value!;
                      //   },
                      //   validator: (value) {
                      //     return logincontroller.validatePassword(value!);
                      //   },
                      // ),
                      TextFormField(
                        obscureText: true, // Hide password text
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Confirm Password",
                          hintText: "Confirm your password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off_outlined),
                        ),
                        // controller: registerPhoneController.confirmPasswordController,
                        onSaved: (value) {
                          // registerPhoneController.confirmPassword = value!;
                        },
                        validator: (value) {
                          // return registerPhoneController.validateConfirmPassword(value!);
                        },
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
