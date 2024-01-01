import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../menu_screen/menu_screen.dart';
import '../reservation_screen/reservation_screen.dart';
import 'calls_history_screen.dart';
import 'controller/teacher_nav_bar_controller.dart';
import 'main_screen.dart';

class TeacherNavBarScreen extends StatelessWidget {
  final currentIndex ;
  TeacherNavBarScreen({
    required this.currentIndex,
    Key? key
  }) : super(key: key);



  final controller = Get.put(TeacherNavBarController());
  List <Widget> screens = [
    MenuScreen(),
    ReservationsScreen(isTeacherNavBar: true),
    CallsHistoryScreen(),
    MainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()
        =>
            Center(
              child: screens.elementAt(
                  controller.selectIndex
              ),
            ),
        ),
        bottomNavigationBar: Obx(() =>
            BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      ImagesHelper.menuIcon,
                      height: 25,
                      color: controller.selectIndex == 0
                          ? ColorStyle.primaryColor
                          : ColorStyle.greyColor.withOpacity(.5)
                  ),
                  label: ' القائمة',
                ),

                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                        ImagesHelper.reservationsIcon,
                        height: 25,
                        color:controller.selectIndex == 1
                            ? ColorStyle.primaryColor
                            : ColorStyle.greyColor.withOpacity(.5)),
                    label: 'الحجوزات'
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      ImagesHelper.quranIcon,
                      height: 25,
                      color: controller.selectIndex == 2
                          ? ColorStyle.primaryColor
                          : ColorStyle.greyColor.withOpacity(.5)
                  ),
                  label: 'السجل',
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagesHelper.homeIcon,
                      height: 25,
                    color: controller.selectIndex == 3
                          ? ColorStyle.primaryColor
                        : ColorStyle.greyColor.withOpacity(.5),
                  ),
                  label: 'الرئيسية',
                ),

              ],
              selectedItemColor: ColorStyle.primaryColor,
              unselectedItemColor: ColorStyle.greyColor.withOpacity(.5),
              backgroundColor: ColorStyle.whiteColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectIndex!,
              onTap: (index) {
                controller!.select(index);
              },
            ),
        )
    );
  }
}