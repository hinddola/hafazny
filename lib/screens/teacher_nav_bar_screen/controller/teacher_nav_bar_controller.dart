import 'package:get/get.dart';
import 'package:hafazny/helper/image_helper.dart';
import 'package:hafazny/screens/menu_screen/menu_screen.dart';
import 'package:hafazny/screens/reservation_screen/reservation_screen.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/calls_history_screen.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/main_screen.dart';

class TeacherNavBarController extends GetxController {
  RxBool isOnlinValue = true.obs;

  final _selectIndex = 0.obs;
  final currentIndex = 3.obs;
  int get selectIndex => _selectIndex.value;

  select(int index) {
    _selectIndex.value = index;
  }
  //int get selectIndex => 0;

  isOnlineToggleSwitch() {
    isOnlinValue.value = !isOnlinValue.value;
    update();
  }

}
