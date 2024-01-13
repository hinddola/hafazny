import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafazny/model/EduLevelModel.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';

import '../../../helper/api_url/api_url.dart';
import '../../../model/CertificateModel.dart';
import 'package:http/http.dart' as http ;

import '../../auth_screens/controller/auth_controller.dart';
import '../../teacher_nav_bar_screen/teacher_nav_bar_screen.dart';

class TeacherSuccessResController extends GetxController{

  final shortInfocontroller = TextEditingController();
  RxInt selectedEduLevel = RxInt(0);

  RxList<int> chosenContent = <int>[].obs;
  RxList<int> chosenEduLevel = <int>[].obs;
  //RxInt chosenEduLevel = RxInt(-1);

  final authController = AuthController();

  CertificateModel certificateModel = CertificateModel();
  EduLevelModel eduLevelModel = EduLevelModel();

  RxList<CertificateModel> selectedCertificates = <CertificateModel>[].obs;
  RxList<EduLevelModel> eduLevelList = <EduLevelModel>[].obs;
  RxList certificateList = [].obs;


  @override
  void onInit(){
    super.onInit();
    getEducationLevels();
    getCertifications();
    // print('LENGTH : ${certificateModel.certifications?.length}');
  }

  ApiUrl apiUrl = ApiUrl();



  List<Map<String, dynamic>> content = [
    {
      'subTitle': 'محمد ابراهيم احمد',
      'title': 'اسم المعلم',
    },
    {
      'subTitle': '#CODE',
      'title': 'كود الطلب',
    },
    {
      'subTitle': '15 اغسطس 2023',
      'title': 'تاريخ الطلب',
    },
    {
      'subTitle': '  03:00 م',
      'title': 'الوقت',
    },
  ];

  updateSelectedEduLevel(int value) {
    selectedEduLevel(value);
    update();
  }

  // Get all Education Levels
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
      }
    } catch (e) {
      print('Error fetching eduLevelModel: $e');
    }
  }



  // Get all Certifications
  getCertifications() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl.certifications),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {

        certificateModel = CertificateModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error fetching _certificatModel: $e');
    }
  }

  // create teacher profile
  createTeacherProfile({
    BuildContext? context
  }) async {
    final user = authController.getUserData();
    print("check user ${user?.id}");
    if (user != null) {
      try {
        final reqBody = {
          "user_id": user?.id,
          "bio": shortInfocontroller.text,
          "education_level_id": chosenEduLevel.value[0]
        };

        final response = await http.post(
            Uri.parse(apiUrl.teacherProfile),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody)
        );

        if (response.statusCode == 201)
          {
            Get.to(TeacherNavBarScreen(currentIndex: 0));

          } else {
          print("error ${response.body}");

          Get.to(TeacherNavBarScreen(currentIndex: 0));

        }

      } catch(e) {
        print("The Error: $e");


      }

    }


  }

  saveData(){
    getCertifications();
    getEducationLevels();
    Get.to(TeacherNavBarScreen(currentIndex: 3));
  }


}

