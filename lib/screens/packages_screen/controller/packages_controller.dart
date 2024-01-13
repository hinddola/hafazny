import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/model/PackagesModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:http/http.dart' as http ;

import '../../../const/style.dart';
import '../../edu_favorites_screens/controller/edu_favourites_controller.dart';
import '../../edu_favorites_screens/edu_favourite_screen1.dart';


class PackagesController extends GetxController{

  ApiUrl apiUrl = ApiUrl();
  PackagesModel packagesModel = PackagesModel();
  final eduFavouritesController = EduFavouritesController();


  @override
  void onInit(){
    getAllPackages();
    //createNewSubscription();
  }

  getAllPackages() async {
    try{
      final response = await http.get(Uri.parse(apiUrl.packages),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200){
        packagesModel = PackagesModel.fromJson(jsonDecode(response.body));
        print('Get all packages success');
        print(response.body);
      }
    }catch(e){
      print('Error found $e');
    }
  }


  createNewSubscription({
    BuildContext? context,
    required int packageId
  }) async {
    try{
      final user = AuthController().getUserData();
      final  subscriptionBody = {
        "user_id": user.id,
        "plan_id": packageId,
        "start_date": "2023-12-31T08:00:00Z",
        "end_date": "2024-12-31T08:00:00Z",
        "is_active": true,
        "payment_status": "completed",
        "payment_method": "credit_card",
        "auto_renew": false,
        "cancellation_reason": null,
        "subscription_type": "yearly",
        "upgrade_from_subscription_id": null,
        "downgrade_to_subscription_id": null,
        "billing_cycle": "monthly",
        "external_subscription_id": "EXT_SUBS_789"
      };

     print(subscriptionBody);
      final response = await http.post(Uri.parse(apiUrl.subscriptions),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(subscriptionBody),
      );
     if (response.statusCode == 201) {
       print(' Subscription Success ');
       print(response.body);
       if (context != null) {
         Get.snackbar(
           'تم الاشتراك في الباقة بنجاح!',
            '',
           snackPosition: SnackPosition.TOP,
           backgroundColor: ColorStyle.primaryColor,
           colorText: Colors.white,
         );
       }
       eduFavouritesController.goToHomeScreen();
     } else {
       if (context != null) {

         Get.snackbar(
           'حدث خطأ أثناء الاشتراك فى الباقة!',
           '',
           snackPosition: SnackPosition.TOP,
           backgroundColor: Colors.red,
           colorText: Colors.white,
         );
       }
     }


    }catch(e){
      print('Error s $e');

    }
  }


}