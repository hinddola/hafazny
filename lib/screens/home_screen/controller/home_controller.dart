import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hafazny/model/HomeImageSlider.dart';
import 'package:hafazny/model/SubscriptionModel.dart';
import 'package:hafazny/model/TeacherProfileModel.dart';
import 'package:http/http.dart' as http ;


import 'package:get/get.dart';

import '../../../const/style.dart';
import '../../../helper/api_url/api_url.dart';
import '../../../model/TeachersDetailesModel.dart';
import '../../../model/slider_model.dart';
import '../../../model/UserSubscriptionsList.dart';
import '../../auth_screens/controller/auth_controller.dart';
import '../../favourite_teachers_screen/controller/favourite_teachers_controller.dart';
import '../../favourite_teachers_screen/favourite_teachers.dart';
import '../teacher_screen.dart';
class HomeController extends GetxController{

  ApiUrl apiUrl = ApiUrl();
  HomeImageSlider homeImageSlider = HomeImageSlider();
  SubscriptionModel subscriptions = SubscriptionModel();
  UserSubscriptionsList userSubscriptions = UserSubscriptionsList();

  TeacherProfileModel teacherProfileModel = TeacherProfileModel();

  TeachersDetailesModel teachersDetailesModel = TeachersDetailesModel();
  final favouriteTeachersController = FavouriteTeachersController();

  var selectedTeacher = null;
  late bool isTeacherFav = false;
  late Teachers selectedTeacherInfo;

  Future<void> onInit() async {

    getImageSlider();
    // await getSubscriptions();
  }



  getImageSlider() async {
    try{
      final response = await http.get(
        Uri.parse(apiUrl.imageSlider) ,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){
        homeImageSlider =  HomeImageSlider.fromJson(jsonDecode(response.body));
      }
    }catch(e){
      print(e);
    }
  }

  Future getSubscriptions() async {
    try{

      final user = AuthController().getUserData();

      final response = await http.get(
        Uri.parse("${apiUrl.UserSubscriptions}/${user.id}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){

        userSubscriptions =  UserSubscriptionsList.fromJson(jsonDecode(response.body));
        print('sadfsadfasdf ${userSubscriptions.userSubscriptions?.length}');
        //print(subscriptions.subscription?.subscriptionDetail?.totalHours);
      }
    }catch(e){
      print(e);
    }
  }

  getTecherProfile(int teacherId) async{
    try{

      selectedTeacher = teacherId;

      final teacher_profile_url = '${apiUrl.teacherProfile}/user/${teacherId}';

      final response = await http.get(
        Uri.parse(teacher_profile_url) ,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){
        teacherProfileModel =  TeacherProfileModel.fromJson(jsonDecode(response.body));
      }
    }catch(e){
      print(e);
    }
  }



  getTeachersDetailes()async{
    try{
      final response = await http.get(
        Uri.parse(apiUrl.teachersDetailes) ,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){
        teachersDetailesModel =  TeachersDetailesModel.fromJson(jsonDecode(response.body));
      }
    }catch(e){
      print(e);
    }
  }


  favTeacher({required BuildContext context , teacherId}) async {
    try {
      //selectedTeacher = teacherId ;
      final user = AuthController().getUserData();
      final response = await http.post(
        Uri.parse(apiUrl.favTeachers),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "user_id": user?.id,
          "teacher_id": teacherId,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          'تمت إضافة المعلم الى المفضلة بنجاح',
          '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorStyle.primaryColor,
          colorText: Colors.white,
        );
        isTeacherFav = true;
        Get.to(TeachersScreen());
      } else {
        Get.snackbar(
          'لقد أضفت هذا المعلم الى المفضلة من قبل',
          '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isTeacherFav = false;
      }
    } catch (e) {
      print("Error: $e");
    }
  }


  checkFavTeacher(teacherId) async {
    isTeacherFav = false;
    await favouriteTeachersController.getFavouriteTeachers();

    favouriteTeachersController.favouriteTeachersModel.favoriteTeachers?.forEach((element) {
      if(element.teacherId == teacherId) {
        isTeacherFav = true;
      }
    });
  }




}