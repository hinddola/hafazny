import 'dart:convert';

import 'package:get/get.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:http/http.dart' as http ;

import '../../../model/NotificationsModel.dart';

class NotificationsController extends GetxController{
  ApiUrl apiUrl = ApiUrl();
  NotificationsModel notificationsModel = NotificationsModel();


  @override
  void onInit(){
    getNotifications();
  }

   getNotifications() async {
    try{
      final response = await http.get(
        Uri.parse(apiUrl.notifications) ,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){
        notificationsModel =  NotificationsModel.fromJson(jsonDecode(response.body));

        print('Notifications');
        print(response.body);

        print(notificationsModel.notifications?.length);
      }
    }catch(e){
      print(e);
    }
  }


}