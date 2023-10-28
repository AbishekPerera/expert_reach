import 'dart:convert';

import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/models/entities/locations.dart';
import 'package:expert_reach/services/services_service.dart';
import 'package:expert_reach/utils/theme/getError_snackBar.dart';
import 'package:expert_reach/utils/theme/getSuccess_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class AddServiceScreenController extends GetxController {
  var isLoading = true.obs;
  ServicesService servicesService = ServicesService();

  RxList<Locations> locationsList = RxList<Locations>([]);

  GlobalKey<FormState> addServiceFormKey = GlobalKey<FormState>();

  var selectedLocation = "".obs;

  TextEditingController? serviceTitleController;
  TextEditingController? serviceDescriptionController;
  TextEditingController? servicePriceController;

  String serviceTitle = "";
  String serviceDescription = "";
  String servicePrice = "";

  @override
  void onInit() async {
    super.onInit();
    serviceTitleController = TextEditingController();
    serviceDescriptionController = TextEditingController();
    servicePriceController = TextEditingController();

    await servicesService.initService();
    getLocations();
  }

  void getLocations() async {
    isLoading(true);

    final response = await servicesService.getLocations();
    // print(response);

    if (response != null) {
      if (response['response']['state'] == 200) {
        locationsList.value = List<Locations>.from(
            response['response']['results'].map((x) => Locations.fromJson(x)));
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  void validate() {
    if (addServiceFormKey.currentState!.validate()) {
      addServiceFormKey.currentState!.save();
      // print("validated");
      addService();
    }
  }

  void addService() async {
    isLoading(true);

    final response = await servicesService.addService(
      serviceTitle,
      serviceDescription,
      selectedLocation.value,
      servicePrice,
      base64Image,
    );

    if (response != null) {
      if (response['response']['state'] == 200) {
        Get.back();
        getSuccessSnackBar(
            "Success", "Service added successfully", Icons.done_all_outlined);
      } else {
        getErrorSnackBar("Bad Request", response['response']['message']);
      }
    } else {
      getErrorSnackBar(
          "Bad Request", "Something went wrong please Login again");
    }

    isLoading(false);
  }

  // :::::::::::::::::::::::::::::::::: Image picker :::::::::::::::::::::::::::::::::::::::::::::::

  Future<CroppedFile?> _cropImage({required XFile imageFile}) async {
    return await ImageCropper().cropImage(uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: cPrimaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio3x2,
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
          if (decodedImage.width > 1000 || decodedImage.height > 667) {
            decodedImage =
                img.copyResize(decodedImage, width: 1000, height: 667);
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
