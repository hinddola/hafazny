import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../helper/image_helper.dart';
import '../../home_screen/student_screen.dart';
import '../../home_screen/teacher_screen.dart';
import '../../menu_screen/menu_screen.dart';
import '../../reservation_screen/reservation_screen.dart';
import '../../session_screen/session_screen.dart';
import '../../teacher_nav_bar_screen/calls_history_screen.dart';
import '../../teacher_nav_bar_screen/main_screen.dart';

class NavBarController extends GetxController{

  final _selectIndex = 4.obs;
  final currentIndex = 0.obs;
  int get selectIndex => _selectIndex.value;

  select(int index) {
    _selectIndex.value = index;
    update();
  }

  List<Map<String, dynamic>> clientScreens = [
    {//0
      'title': 'القائمة',
      'icon': ImagesHelper.menuIcon,
      'screen':  MenuScreen()
    },
    {//1
      'title': 'الجلسات',
      'icon': ImagesHelper.sessionsIcon,
      'screen':  SessionsScreen()
    },
    {//2
      'title': 'الحجوزات',
      'icon': ImagesHelper.reservationsIcon,
      'screen':  ReservationsScreen(isTeacherNavBar: false,)
    },
    {//3
      'title': 'المعلمون',
      'icon': ImagesHelper.teachersIcon,
      'screen':  TeachersScreen()
    },
    {//4
      'title': 'الرئيسية',
      'icon': ImagesHelper.homeIcon,
      'screen':  StudentHomeScreen()
    }
  ];
  // List<Map<String, dynamic>> navScreens = [
  //   {
  //     'title': 'القائمة',
  //     'icon': ImagesHelper.menuIcon,
  //     'screen': MenuScreen(),
  //   },
  //   {
  //     'title': 'الحجوزات',
  //     'icon': ImagesHelper.reservationsIcon,
  //     'screen': ReservationsScreen(isTeacherNavBar: true),
  //   },
  //   {
  //     'title': 'السجل',
  //     'icon': ImagesHelper.quranIcon,
  //     'screen': CallsHistoryScreen(),
  //   },
  //   {
  //     'title': 'الرئيسية',
  //     'icon': ImagesHelper.homeIcon,
  //     'screen': MainScreen(),
  //   }
  // ];

}