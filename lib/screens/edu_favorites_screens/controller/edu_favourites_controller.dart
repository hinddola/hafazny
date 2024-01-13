import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/model/LoginModel.dart';
import 'package:hafazny/model/PathModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:http/http.dart' as http ;
import '../../../components/radio_container.dart';
import '../../../const/style.dart';
import '../../../model/Paths.dart';

class EduFavouritesController extends GetxController {
  ApiUrl apiUrl = ApiUrl();
  final authController = AuthController();
  RxInt selectedValue = RxInt(0);
  RxBool lastPath = RxBool(false);

  PathModel pathModel = PathModel();
  LoginModel loginModel = LoginModel();

  RxList<Paths> pathsList = <Paths>[].obs;
  Rx<Paths?> currentPath = Rx<Paths?>(null);

  int currentPage = 0;
  int currentContent = 0;
  RxInt currentItem = 0.obs;


  updateSelectedValue(int value) {
    selectedValue(value);
    update();
  }


  Future<void> getPaths()async{
    try{
      final response =  await http.get(Uri.parse(apiUrl.paths),
        headers: {
          'Content-Type' : 'application/json',
        },
      );

      if(response.statusCode == 200){

        print('ALL PATHS');
        // print();
        final pathModel = PathModel.fromJson(jsonDecode(response.body));
        print('print model');

        print(pathModel.paths);
        //
        pathsList.value = pathModel.paths!;
        print('pathsList');
        if (pathsList.isNotEmpty) {
          setCurrentPath(pathsList[0]);
        }
        print('runTimeType');
        print(currentPath.value?.title);

        // final allPaths = pathModel.paths?.toList();
      }
    }catch(e){
      print('Error fetching paths: $e');
      print(Uri.parse(apiUrl.paths));
    }
  }

  void setCurrentPath(Paths? path) {
    currentPath.value = path;
  }

  void goToNextPath() {
    print("lastPath.value");
    print(lastPath.value);

    if ((currentItem.value + 1) == pathsList.length) {
      lastPath.value = true;
    } else {

      final pathItems = pathsList[(currentItem.value + 1)]?.pathItems;


      final int wrappedIndex = (currentItem.value + 2) % pathsList.length;
      final futurePathItems = pathsList[wrappedIndex]?.pathItems;

      // final futurePathItems = pathsList[(currentItem.value + 2)]?.pathItems;
      // print("FuturePathItems $futurePathItems");
      if (futurePathItems?.length == 0) {
        lastPath.value = true;

      }
      if (pathItems != null && pathItems.isNotEmpty) {
        createUserPath();
        currentItem.value = (currentItem.value + 1) % pathsList.length;
      } else {
        currentItem.value = (currentItem.value + 1) % pathsList.length;
        goToNextPath();
      }
    }
  }

  void goToPrevPath() {
    currentItem.value = (currentItem.value - 1) % pathsList.length;
  }

  void goToHomeScreen() {
    createUserPath();
    Get.to(NavBarScreen(currentIndex: 4));
  }

  createUserPath() async {
    final user = authController.getUserData();

    if (user != null) {

      try {
        final reqBody = {
          "user_id": user?.id,
          "path_id": pathsList[currentItem.value]?.id,
          "path_item_id": selectedValue.value
        };

        final response = await http.post(
            Uri.parse(apiUrl.paths_users),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody)
        );

        selectedValue.value = 0;

      } catch(e) {
        print("The Error: $e");
      }

    }




  }

}

