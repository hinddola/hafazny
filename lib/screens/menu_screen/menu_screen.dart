import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/login_screen/login_screen.dart';
import 'package:hafazny/screens/packages_screen/packages_screen.dart';
import 'package:hafazny/screens/plan_screen/plan_screen.dart';
import 'package:hafazny/screens/profile_screen/edite_profile_screen.dart';
import 'package:hafazny/screens/setting_screen/setting_screen.dart';
import 'package:hafazny/screens/splash_screen/splash_screen.dart';
import 'package:hafazny/screens/teacher_screen/teacher_balance.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_button.dart';
import '../../components/menu_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../student_subscriptions_screen/student_subscriptions_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key , required this.isStudent});

  bool isStudent = false ;
  //final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0.r),
          child: Column(
            children: [
               CustomAppBar(
                title: 'القائمة', isMainScreen: false,
              ),
              const SizedBox(
                height: 40,
              ),
               MenuCard(
                content: const [
                  {
                    'title': 'بيانات الحساب',
                    'icon': ImagesHelper.profileDetailsIcon,
                  },

                ], onTap: () { Get.to(EditProfileScreen()); },
              ),
               isStudent ?
               MenuCard(
                content: const [
                  {
                    'title': 'الباقات',
                    'icon': ImagesHelper.packagesIcon,
                    //'route': Routes.packages
                  },

                ], onTap: () { Get.to(PackagesScreen()); },
              ): SizedBox(
                 width: 10.w,
               ),

              isStudent ?  MenuCard(
                content: const [
                  {
                    'title': 'الاشتراكات',
                    'icon': ImagesHelper.uploadImageIcon,
                  }

                ], onTap: () { Get.to(StudentSubscriptionsScreen()); },
              ) :
              MenuCard(
                content: const [
                  {
                    'title': 'الرصيد',
                    'icon': ImagesHelper.uploadImageIcon,
                  }

                ], onTap: () { Get.to(TeacherBalance()); },
              ),


              //  MenuCard(
              //   content: const [
              //     {'title': 'القرآن الكريم', 'icon': ImagesHelper.quranIcon },
              //
              //   ], onTap: () {  },
              // ),

              //  MenuCard(
              //   content: const [
              //     {'title': 'الخطة', 'icon': ImagesHelper.planIcon}
              //
              //   ], onTap: () { Get.to(PlanScreen()); },
              // ),

              //  MenuCard(
              //   content: const [
              //     {
              //       'title': 'الدعوات',
              //       'icon': ImagesHelper.privacyPolicyIcon
              //     },
              //   ], onTap: () {  },
              // ),
               MenuCard(
                content: const [
                  {
                    'title': 'الإعدادات',
                    'icon': ImagesHelper.settingIcon
                  },

                ], onTap: () { Get.to(SettingScreen()); },
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  if (AuthController().getUserData() != null) {
                    AuthController().signOut();
                    Get.to(SplashScreen());
                  }
                },
                background: ColorStyle.redColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الخروج',
                      style: TextStyleHelper.button16
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      ImagesHelper.logoutIcon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
