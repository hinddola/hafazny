import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/helper/image_helper.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/notification_screen/notification_screen.dart';
import 'package:hafazny/screens/on_boarding_screens/controller/controller.dart';
import 'package:hafazny/screens/profile_screen/edite_profile_screen.dart';
import '../const/style.dart';
import 'customed_notification_icon.dart';

class CustomAppBar extends StatelessWidget {
  bool isMainScreen;
  String? title;
  // bool isStudent = OnBoardingController().isStudent;

   CustomAppBar({
    Key? key,
     required this.isMainScreen,
    this.title
  }) : super(key: key);

   final authController = Get.put(AuthController());
  final user = AuthController().getUserData();
  final onBoardingController = Get.put(OnBoardingController());


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.to(NotificationScreen());
            },
            child: CircleAvatar(
              backgroundColor: ColorStyle.greyColor.withOpacity(0.2),
              child: SvgPicture.asset(ImagesHelper.notificationIcon),
            ),
          ),
          SizedBox(width: 20.w,),
          isMainScreen ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'اهلا بك',
                style: TextStyleHelper.button16
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
              '${user?.name}',
                  style: TextStyleHelper.button13.copyWith(
                      color: ColorStyle.lightNavyColor,
                      fontWeight: FontWeight.normal,
                    fontSize: 16.sp
                  ),
                textAlign: TextAlign.center,
              ),
            ],
          ) :
              Text(
                  title!,
                  style: TextStyleHelper.button16,
                textAlign: TextAlign.center,
              ),

          GestureDetector(
            onTap: () {
              Get.to(EditProfileScreen());
            },
            child: CircleAvatar(
              radius: 35,
              backgroundImage:
              // user.roleIde ==1 ? AssetImage('assets/images/student.png') : AssetImage('assets/images/teacher.png'),
              AssetImage('assets/images/student.png')

              // }
    //               ? AssetImage('assets/images/student.png')
    //               : AssetImage('assets/images/teacher.png'), // Use a different image for teachers
            ),
          ),

        ],
      ),
    );
  }
}
