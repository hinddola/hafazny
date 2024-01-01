import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hafazny/const/style.dart';
import '../teacher_nav_bar_screen/calls_history_screen.dart';
import '../teacher_nav_bar_screen/main_screen.dart';
import 'controller/nav_bar_controller.dart';
import '../home_screen/student_screen.dart';
import '../home_screen/teacher_screen.dart';
import '../menu_screen/menu_screen.dart';
import '../reservation_screen/reservation_screen.dart';
import '../session_screen/session_screen.dart';

class NavBarScreen extends StatelessWidget {
  //bool? isTeacherNavBar;
  int currentIndex;
  NavBarScreen({
    required this.currentIndex,
    Key? key,
    //required this.isTeacherNavBar
  }) : super(key: key);

  final controller = Get.put(NavBarController());

  List<Widget> screens = [
    MenuScreen(), //0
    SessionsScreen(), //1
    ReservationsScreen(isTeacherNavBar: false,), //2
    TeachersScreen(), //3
    StudentHomeScreen() //4
  ];

  // List navBarscreens =[
  //   MenuScreen(),
  //   ReservationsScreen(isTeacherNavBar: true,),
  //   CallsHistoryScreen(),
  //   MainScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavBarController>(
        builder: (controller) {
          return Center(
            child: screens.elementAt(controller.selectIndex),
          );
        },
      ),

        bottomNavigationBar:
        GetBuilder<NavBarController>(
          builder: (controller){
            return BottomNavigationBar(
               items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      controller.clientScreens[0]['icon'],
                      height: 25,
                      color: controller.selectIndex == 0
                          ? ColorStyle.primaryColor : ColorStyle.greyColor.withOpacity(.5),),
                    label: controller.clientScreens[0]['title']
                ),

                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      controller.clientScreens[1]['icon'],
                      height: 25,
                      color: controller.selectIndex == 1
                          ? ColorStyle.primaryColor : ColorStyle.greyColor.withOpacity(.5),),
                    label: controller.clientScreens[1]['title']
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    controller.clientScreens[2]['icon'],
                    height: 25,
                    color: controller.selectIndex == 2
                        ? ColorStyle.primaryColor : ColorStyle.greyColor.withOpacity(.5),),
                  label: controller.clientScreens[2]['title'],
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    controller.clientScreens[3]['icon'],
                    height: 25,
                    color: controller.selectIndex == 3
                        ? ColorStyle.primaryColor : ColorStyle.greyColor.withOpacity(.5),),
                  label: controller.clientScreens[3]['title'],
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      controller.clientScreens[4]['icon'],
                      height: 25,
                      color: controller.selectIndex == 4 ? ColorStyle.primaryColor : ColorStyle.greyColor.withOpacity(.5)
                  ),
                  label: controller.clientScreens[4]['title'],
                ),
              ],
              selectedItemColor: ColorStyle.primaryColor,
              unselectedItemColor: ColorStyle.greyColor.withOpacity(.5),
              backgroundColor: ColorStyle.whiteColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectIndex!,
              onTap: (index) {
                controller!.select(index);
                controller.update();
              },
            );
          },
        )
    );
  }
}

// items: <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// controller.navScreens[0]['icon'],
// height: 25,
// color: controller.selectIndex == 0
// ? ColorStyle.primaryColor
//     : ColorStyle.greyColor.withOpacity(.5),
// ),
// label: controller.navScreens[0]['title'],
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// controller.navScreens[1]['icon'],
// height: 25,
// color: controller.selectIndex == 1
// ? ColorStyle.primaryColor
//     : ColorStyle.greyColor.withOpacity(.5),
// ),
// label: controller.navScreens[1]['title'],
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// controller.navScreens[2]['icon'],
// height: 25,
// color: controller.selectIndex == 2
// ? ColorStyle.primaryColor
//     : ColorStyle.greyColor.withOpacity(.5),
// ),
// label: controller.navScreens[2]['title'],
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// controller.navScreens[3]['icon'],
// height: 25,
// color: controller.selectIndex == 3
// ? ColorStyle.primaryColor
//     : ColorStyle.greyColor.withOpacity(.5),
// ),
// label: controller.navScreens[3]['title'],
// ),
// ],