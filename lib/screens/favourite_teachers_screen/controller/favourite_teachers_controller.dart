import 'dart:convert';

import 'package:get/get.dart';
import 'package:hafazny/model/FavouriteTeachersModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:http/http.dart' as http ;

import '../../../helper/api_url/api_url.dart';

class FavouriteTeachersController extends GetxController {

  ApiUrl apiUrl = ApiUrl();
  FavouriteTeachersModel favouriteTeachersModel = FavouriteTeachersModel();
  late final FavoriteTeachers selectedTeacherInfo;
  bool hasFavTeachers = false;

  getFavouriteTeachers() async {
    try {

      final user = AuthController().getUserData();
      // favouriteTeachersModel = [] as FavouriteTeachersModel;

      final response = await http.get(Uri.parse('${apiUrl.oneUserFavTeachers}${user.id}'),
        headers: {"Content-Type": "application/json"},
      );

      print("QWEQWE ${response.body}");

      if (response.statusCode == 200) {
        hasFavTeachers = true;
        favouriteTeachersModel = FavouriteTeachersModel.fromJson(jsonDecode(response.body));

        print(favouriteTeachersModel.favoriteTeachers?.length);
        print(' USER ID ${user.id}');
      } else {
        hasFavTeachers = false;
      }
    } catch (e) {
      print('Error found $e');
      hasFavTeachers = false;
    }
  }
}