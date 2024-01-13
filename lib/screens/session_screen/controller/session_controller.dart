import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/model/SessionsModel.dart';
import 'package:http/http.dart' as http ;
import 'package:intl/intl.dart';

import '../../auth_screens/controller/auth_controller.dart';
import '../../home_screen/controller/home_controller.dart';
import '../../reservation_screen/controller/reservation_controller.dart';

class SessionController extends GetxController{

  ApiUrl apiUrl = ApiUrl();
  RxDouble sliderValue= 50.0.obs;
  final user = AuthController().getUserData();
  SessionsModel sessionModel = SessionsModel();
  final homeController = HomeController();
  // final reservationController = ReservationController();


  @override
  void onInit(){
    //createNewSession(43);
    print('tacherIde');
    print(homeController.selectedTeacher);

  }

  List<Map<String, dynamic>> content = [
    {
      'subTitle': 'مكتمل',
      'title': 'السجل',
    },
    {
      'subTitle': '5.8',
      'title': 'عدد الأوجة المنجزة',
    },
    {
      'subTitle': '34',
      'title': 'أخطاء الكلمات',
    },
    {
      'subTitle': '45',
      'title': 'التردد',
    },
    {
      'subTitle': '1',
      'title': 'أخطاء التجويد',
    },
  ];

  createNewSession({
    required String startDate,
    required String startTime,
    required int teacherId
  }) async {
    try {
      final createBody = {
        "teacher_id": teacherId,
        "student_id": user.id,
        "start_time": convertDateString("$startDate $startTime"),
        "status": "scheduled",

        "end_time": null,
        "duration": null,
        "topic": "test",
        "notes": ""
      };

      final response = await http.post(
        Uri.parse(apiUrl.sessions),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(createBody),
      );
      if (response.statusCode == 201) {
        print('creation success');
        print(response.body);
      }

    } catch (e) {
      print('Creation Error $e');
    }
  }

  String convertDateString(String inputDate) {
    // Parse the input date string
    DateTime parsedDate = DateFormat("dd/M/yyyy h:mm a").parse(inputDate);

    // Format the date in the desired output format
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(parsedDate);

    return formattedDate;
  }




}