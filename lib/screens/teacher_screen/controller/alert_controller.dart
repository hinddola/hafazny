
import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:http/http.dart' as http ;

class ALertController extends GetxController{

  ApiUrl apiUrl = ApiUrl();

  @override
  void onInit(){
    createAlert();
  }

  createAlert() async{
    try{
      final user = AuthController().getUserData();
      final alertBody = {
        "user_id": user.id,
        "message": "This is a test message",
        "read": false
      };
      final response = await http.post(Uri.parse(apiUrl.alerts),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(alertBody)
      );

      if (response.statusCode == 201){

      }
    }catch(e){
      print('Error $e');
    }
  }

}
