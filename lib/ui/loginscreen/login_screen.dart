import 'package:expert_reach/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/controllers/login_screen/login_screen_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController logincontroller =
      Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 40),
                  height: screenSize.height * 0.20,
                  alignment: Alignment.center,
                  child: const Center(
                    child: Image(
                      image: AssetImage(LogoLinear),
                    ),
                  )),

              SizedBox(height: screenSize.height * 0.05),

              Text("Sign In", style: Theme.of(context).textTheme.displayLarge),
              Text(
                "Please sign in to continue",
                style: Theme.of(context).textTheme.labelSmall,
              ),

              // :::::::::::::::::::::::::::::::::::::::::::::::: FORM

              Form(
                  key: logincontroller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_outlined),
                            labelText: "Email ",
                            hintText: "abc@domain.com",
                            border: OutlineInputBorder(),
                          ),
                          controller: logincontroller.userNameController,
                          onSaved: (value) {
                            logincontroller.userName = value!;
                          },
                          validator: (value) {
                            return logincontroller.validateEmail(value!);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextFormField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fingerprint_outlined),
                                labelText: "Password ",
                                hintText: "*********",
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      logincontroller.togglePassword();
                                    },
                                    icon: logincontroller.obscurePWText.value
                                        ? const Icon(Icons.visibility_outlined)
                                        : const Icon(
                                            Icons.visibility_off_outlined))),
                            obscureText: logincontroller.obscurePWText.value,
                            controller: logincontroller.passwordController,
                            onSaved: (value) {
                              logincontroller.password = value!;
                            },
                            validator: (value) {
                              return logincontroller.validatePassword(value!);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("Forget Password ?",
                                style: Theme.of(context).textTheme.labelSmall)),
                        Obx(
                          () => SizedBox(
                              width: double.infinity,
                              child: logincontroller.isLoading.value == true
                                  ? const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: LinearProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        // logincontroller.loginToDashboard();
                                        logincontroller.checkLogin();
                                      },
                                      child: const Text("SIGN IN"))),
                        ),

                        // :::::::::::::::::::::::::::::::::::::::::::::::: or Register

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ? ",
                                style: Theme.of(context).textTheme.labelSmall),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed("/register");
                                },
                                child: Text("Register",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: cPrimaryColor))),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
