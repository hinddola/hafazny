import 'dart:convert';

import 'package:hafazny/model/QuraanModel.dart';
import 'package:http/http.dart' as http ;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuraanController extends GetxController{

    final quraanUrl = 'http://api.alquran.cloud/v1/quran/quran-uthmani';

    getQuraan()async{
      try{
        final response = await http.get(Uri.parse(quraanUrl),
          headers: {
            'Content-Type' : 'application/json',
          }
        );
        print(response.statusCode);
        print(response.body);

        if(response.statusCode == 200){
          return QuraanModel.fromJson(jsonDecode(response.body));
        }else {
          throw Exception("اتصال النت ضعيف");
        }

      }catch(e){
        print(e);
        throw Exception("اتصال النت ضعيف");
      }
    }
}