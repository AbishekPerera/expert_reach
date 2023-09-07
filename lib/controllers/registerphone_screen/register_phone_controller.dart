import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterPhoneController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    phoneNameController = TextEditingController();
  }

  @override
  void onClose() {
    phoneNameController.dispose();
  }

  // ::::::::::::::::::::::::::::::::::::::::::Form area
  var isLoading = false.obs;

  final GlobalKey<FormState> registerPhoneFormKey = GlobalKey<FormState>();

  late TextEditingController phoneNameController;
  var phoneName = "";

  //phone name validation
  String? validatePhoneName(String value) {
    if (value.length <= 3) {
      return "Phone name must be of 3 chars";
    }

    return null;
  }

  //form key validation
  void validateRegisterPhoneForm() {
    if (registerPhoneFormKey.currentState!.validate()) {
      registerPhoneFormKey.currentState!.save();
      print("validated");
      print(phoneName);
      Get.toNamed("/home-screen");
    } else {
      print("not validated");
    }
  }
}
