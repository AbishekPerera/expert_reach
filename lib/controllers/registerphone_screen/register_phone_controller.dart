import 'dart:convert';

import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/services/register_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:expert_reach/utils/theme/getSuccess_snackBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class RegisterPhoneController extends GetxController {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  var firstName = "";
  var lastName = "";
  var email = "";
  var phone = "";
  var password = "";
  var confirmPassword = "";

  var obscureText = true.obs;

  RegisterService registerService = RegisterService();

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  // ::::::::::::::::::::::::::::::::::::::::::Form area
  var isLoading = false.obs;

  final GlobalKey<FormState> registerPhoneFormKey = GlobalKey<FormState>();

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
      registerUser();
    } else {
      print("not validated");
    }
  }

  // register user
  Future registerUser() async {
    isLoading.value = true;
    try {
      final responseData = await registerService.registerUser(
        firstName,
        lastName,
        email,
        phone,
        password,
        base64Image,
      );

      if (responseData != null) {
        if (responseData['response']['state'] == 200) {
          if (responseData['response']['results']['device_session'] != "") {
            Get.back();
            getSuccessSnackBar("Success", "You have successfully registerd",
                Icons.done_all_outlined);
          } else {
            //Login Error
            getErrorSnackBar("Error", "Authentication failed");
          }
        } else {
          getErrorSnackBar("Bad Request", responseData['response']['message']);
        }
      } else {
        getErrorSnackBar(
            "Bad Request", "Something went wrong please Login again");
      }
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }

// :::::::::::::::::::::::::::::::::: Image picker :::::::::::::::::::::::::::::::::::::::::::::::

  Future<CroppedFile?> _cropImage({required XFile imageFile}) async {
    return await ImageCropper().cropImage(uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: cPrimaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          activeControlsWidgetColor: cPrimaryColor,
          dimmedLayerColor: cPrimaryColor.withOpacity(0.5),
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Crop Image',
      ),
    ], sourcePath: imageFile.path);
  }

  var selectedImagePath = ''.obs;
  String base64Image = "";
  String base64ImageThumb = "";

  Future<void> getImage(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: imageSource);

    if (image != null) {
      final croppedImage = await _cropImage(imageFile: image);
      if (croppedImage != null) {
        // Read the image file
        final bytes = await croppedImage.readAsBytes();

        // Decode the image
        var decodedImage = img.decodeImage(bytes);
        if (decodedImage != null) {
          // Scale down the image if it's larger than the maximum resolution
          if (decodedImage.width > 1000 || decodedImage.height > 1000) {
            decodedImage =
                img.copyResize(decodedImage, width: 1000, height: 1000);
          }

          // Compress the image
          final compressedBytes = img.encodeJpg(decodedImage, quality: 50);

          // Convert the compressed image to base64
          base64Image = base64Encode(compressedBytes);
          // Update the selectedImagePath variable
          selectedImagePath.value = croppedImage.path;
          // print(base64Image);
        }
      }
    }
  }
}
