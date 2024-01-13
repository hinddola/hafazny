// search_controller.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:http/http.dart' as http;
import '../../../model/TeachersDetailesModel.dart';

class TeacherSearchController extends GetxController {
  var teachers = <Teachers>[].obs;
  var isLoading = false.obs;
  ApiUrl apiUrl = ApiUrl();
  TeachersDetailesModel teachersDetailesModel = TeachersDetailesModel();

  fetchTeachers() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(apiUrl.teachersDetailes),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        teachersDetailesModel = TeachersDetailesModel.fromJson(jsonDecode(response.body));
        teachers.assignAll(teachersDetailesModel.teachers ?? []);
        return teachers;
      }
    } catch (e) {
      print('ERROR $e');
    } finally {
      isLoading.value = false;
    }

    // Return an empty list in case of an error
    return [];
  }

  List<Teachers> searchTeachers(String query) {
    return teachers
        .where((teacher) =>
    teacher.name?.toLowerCase().contains(query.toLowerCase()) ?? false ||
        teacher.email!.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
  }
}
