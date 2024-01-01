import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hafazny/model/EduLevelModel.dart';

import '../../../helper/api_url/api_url.dart';
import '../../../model/CertificateModel.dart';
import 'package:http/http.dart' as http ;

import '../../auth_screens/controller/auth_controller.dart';

class TeacherSuccessResController extends GetxController{

  final shortInfocontroller = TextEditingController();
  final selectedcontroller = TextEditingController();
  final eduLevelcontroller = TextEditingController();
  RxInt selectedEduLevel = RxInt(0);

  RxInt chosenContent = RxInt(-1);
  RxInt partMemorized = RxInt(-1);


  final authController = AuthController();

  @override
  onInit(){
    super.onInit();
    getEducationLevels();
    // getCertifications();
  }
  ApiUrl apiUrl = ApiUrl();

  RxList<EduLevelModel> eduLevelList = <EduLevelModel>[].obs;
  RxList<CertificateModel> certificateList = <CertificateModel>[].obs;
  RxList<CertificateModel> selectedCertificates = <CertificateModel>[].obs;


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

  // List<String> dataContent = [
  //   'الكل',
  //   'تلقين',
  //   'مراجعة',
  //   'إقراء واجازة',
  //   'حفظ وتثبيت',
  //   'تصحيح التلاوة'
  // ];
  // List<String> partMemorizedList = [
  //   'الكل',
  //   'جزء',
  //   'سورة',
  //   'صفحات',
  // ];



  updateSelectedEduLevel(int value) {
    selectedEduLevel(value);
    update();
  }

  // Get all Education Levels
  getEducationLevels() async {
    try {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah");
      final response = await http.get(
        Uri.parse(apiUrl.education_levels),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print("response.body");
      print(response.body);

      if (response.statusCode == 200) {
        final eduLevelModel = EduLevelModel.fromJson(jsonDecode(response.body));
        print('print model');
        print(eduLevelModel.educationLevels);

        if (eduLevelModel.educationLevels != null) {
          eduLevelList.value = eduLevelModel.educationLevels!.cast<EduLevelModel>();
          // !.map((educationLevel) =>
          //     EduLevelModel.fromJson(educationLevel.toJson()))
          //     .toList();

          print(eduLevelList.value);
        }
      }
    } catch (e) {
      print('Error fetching eduLevelModel: $e');
    }
  }

  // Get all Certifications
  Future<void> getCertifications() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl.certifications),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final certificatModel = CertificateModel.fromJson(jsonDecode(response.body));
        print('print model');
        print(certificatModel.certifications?[0].name);

        if (certificatModel.certifications != null) {
          certificateList.value = certificatModel.certifications!
              .map((item) => CertificateModel.fromJson(item.toJson())).toList();
        }
      }
    } catch (e) {
      print('Error fetching eduLevelModel: $e');
    }
  }

  // create teacher profile
  createTeacherProfile() async {
    final user = authController.getUserData();

    if (user != null) {
      try {
        final reqBody = {
          "user_id": user?.id,
          "bio": shortInfocontroller.text,
          "education_level_id": selectedEduLevel.value
        };

        print(reqBody);

        final response = await http.post(
            Uri.parse(apiUrl.teacher_profiles),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody)
        );

        print("response teacher profile ");
        print(response.body);

      } catch(e) {
        print("The Error: $e");
      }

    }


  }

}