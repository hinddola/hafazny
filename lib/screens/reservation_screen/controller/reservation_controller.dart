import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hafazny/const/style.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/model/SessionsModel.dart';
import 'package:hafazny/model/TeacherSessions.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:http/http.dart' as http ;

import '../../../model/StudentSessions.dart';
import '../../home_screen/controller/home_controller.dart';
import '../../session_screen/controller/session_controller.dart';

class ReservationController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;

  ApiUrl apiUrl = ApiUrl();
  SessionsModel sessionsModel = SessionsModel();

  SessionController sessionController = SessionController();
  HomeController homeController = HomeController();
  StudentSessions studentSessions = StudentSessions();
  TeacherSessions teacherSessions = TeacherSessions();

  bool hasSessions = false;
  bool teacherHasSessions = false;

 // List<StudentSessions> dataList = [].obs as List<StudentSessions>;

  @override
  void onInit() {
    getSessions();
    getStudentSessions();
    getTeacherSessions();
  }

  void startDateMethod(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030, 12, 30),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorStyle.primaryColor,
              onPrimary: ColorStyle.whiteColor,
              onSurface: ColorStyle.navyColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorStyle.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      date = selectedDate;
      print(homeController?.selectedTeacher);
      dateController.text = '${date!.day}/${date!.month}/${date!.year}';

    }
    update();
  }

  void selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorStyle.primaryColor,
              onPrimary: ColorStyle.whiteColor,
              onSurface: ColorStyle.navyColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorStyle.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      time = selectedTime;
      timeController.text = selectedTime.format(context);
    }
    update();
  }


  getSessions() async {
    try {
      final response = await http.get(Uri.parse(apiUrl.sessions),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        sessionsModel = SessionsModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error found $e');
    }
  }

  getStudentSessions() async {
    try {
      final user = AuthController().getUserData();
      final response = await http.get(Uri.parse('${apiUrl.sessions}/s/${user.id}'),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        studentSessions = StudentSessions.fromJson(jsonDecode(response.body));
        hasSessions = true;
      } else {
        hasSessions = false;
      }
    } catch (e) {
      hasSessions = false;
      print('Error found $e');
    }
  }

  getTeacherSessions() async {
    try {
      //final user = AuthController().getUserData();
      final user = AuthController().getUserData();
      print("USER ID ${user?.id}");
      final response = await http.get(Uri.parse('${apiUrl.sessions}/t/${user?.id}'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        teacherSessions = TeacherSessions.fromJson(jsonDecode(response.body));
        teacherHasSessions = true;

      } else {
        teacherHasSessions = false;
      }
    } catch (e) {
      teacherHasSessions = false;
      print('Error found $e');
    }
  }


  cancelSession(int index) {
  if (studentSessions.lectures != null &&
  index >= 0 &&
  index < studentSessions.lectures!.length) {
  // Remove the session from the list
  studentSessions.lectures!.removeAt(index);

  // Trigger a rebuild of the widget tree
  update();
  }
  }
  }

