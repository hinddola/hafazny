import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'dart:io';
import 'package:http/http.dart' as http ;
import 'package:image_picker/image_picker.dart';

import '../../../const/style.dart';
import '../../../helper/api_url/api_url.dart';
import '../../../helper/shared_pref.dart';
import '../../../model/EduLevelModel.dart';
import '../../../model/SIngleUserModel.dart';

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
  RxInt selectedEduLevel = RxInt(0);
  SIngleUserModel sIngleUserModel = SIngleUserModel();
  EduLevelModel eduLevelModel = EduLevelModel();
  AuthController authController =AuthController();

  late final avatarImage;

  ApiUrl apiUrl = ApiUrl();
  RxList<EducationLevels>? educationLevels = <EducationLevels>[].obs;

  @override
  void onInit(){
    getSinglUserData();
    print('USER id');
    authController.getUserData();
  }

  updateUserData({
    required name,
    required email,
    required phone,
    required gender,
    BuildContext? context,
  }) async {
    try {
      String _gender = "female";
      gender.toString() == "ذكر" ?  _gender = "male" : _gender = "female";

      final request_body = {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "gender": _gender,
      };

      final user = AuthController().getUserData();
      final response = await http.post(
        Uri.parse("${apiUrl.user_paths}/${user?.id}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request_body),
      );

      print("object ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم تعديل البيانات بنجاح',
          '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorStyle.primaryColor,
          colorText: Colors.white,
        );

        AuthController().updateUserData(response.body);

      } else {
        Get.snackbar(
          'فشل في التسجيل!','',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,);
        // ScaffoldMessenger.of(context!).showSnackBar(
        //   const SnackBar(content: Text(), backgroundColor: Colors.red),
        // );
      }
    } catch (e) {
      Get.snackbar(
        'فشل في التسجيل!',
        '$e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("EEEEEEEEEEEEEEEEEEEEEEEE $e");
      // ScaffoldMessenger.of(context!).showSnackBar(
      //   const SnackBar(content: Text('فشل في التسجيل!'), backgroundColor: Colors.red),
      // );
    }
  }

  getSinglUserData() async{
   try{

     final user = AuthController().getUserData();
     final user_url = '${apiUrl.paths_users}/${user?.id}';

     final response = await http.get(
       Uri.parse(user_url),
       headers: {
         'Content-Type': 'application/json',
       },
     );

     if (response.statusCode == 200) {
       sIngleUserModel = SIngleUserModel.fromJson(jsonDecode(response.body));
       print("USER Pathes-----------------------------");
       print(sIngleUserModel.userPaths?[0].pathId);


     }
   }catch(e){
     print('SINGLE USER ERROR $e');
   }
  }

  getEducationLevels() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl.education_levels),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        eduLevelModel = EduLevelModel.fromJson(jsonDecode(response.body));
        print("eduLevelModel");
        print(eduLevelModel.educationLevels?[0].name);
      }
    } catch (e) {
      print('Error fetching eduLevelModel: $e');
    }
  }

  pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Update the avatar image in the UI
      avatarImage = File(pickedImage.path);
      update(); // Ensure the UI is updated
    }
  }

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
