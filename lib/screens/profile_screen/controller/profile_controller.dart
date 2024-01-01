import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final nationalityController = TextEditingController();
  final eduTrackController = TextEditingController();
  final ageRangeController = TextEditingController();
  final readWritelevelController = TextEditingController();

  final RxList<File> imageList = <File>[].obs;
  final Rx<File?> singleGalleryImage = Rx<File?>(null);
  final Rx<File?> singleCameraImage = Rx<File?>(null);

   getImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      imageList.assignAll(images.map((e) => File(e.path)).toList());
      update();
    }
  }

   getSingleGalleryImage() async {
    XFile? pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      singleGalleryImage.value = File(pickedImage.path);
      update();
    }
  }

   getSingleCameraImage() async {
    XFile? pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      singleCameraImage.value = File(pickedImage.path);
      update();
    }
  }
}
