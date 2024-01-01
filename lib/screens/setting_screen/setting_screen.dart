import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hafazny/helper/image_helper.dart';

import '../../components/customed_back_arrow.dart';
import '../../const/style.dart';
import 'controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'الاعدادات',
          style: TextStyleHelper.subtitle19,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 100.h,
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      ColorStyle.greyColor.withOpacity(.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Transform.scale(
                      scale: 1.5, // Adjust the scale factor as needed
                      child: Switch(
                        value: controller.audioValue.value,
                        onChanged: (bool value) {
                          controller.audioToggleSwitch();
                        },
                        activeTrackColor:
                            ColorStyle.primaryColor.withOpacity(0.5),
                        activeColor: ColorStyle.primaryColor,
                        inactiveTrackColor:
                            ColorStyle.greyColor.withOpacity(0.5),
                        inactiveThumbColor: ColorStyle.greyColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'مكالمات صوتية',
                        style: TextStyleHelper.subtitle19.copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: ColorStyle.primaryColor.withOpacity(0.1),
                    child: SvgPicture.asset(
                      ImagesHelper.callIcon
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100.h,
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      ColorStyle.greyColor.withOpacity(.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Transform.scale(
                      scale: 1.5, // Adjust the scale factor as needed
                      child: Switch(
                        value: controller.videoValue.value,
                        onChanged: (bool value) {
                          controller.videoToggleSwitch();
                        },
                        activeTrackColor:
                            ColorStyle.primaryColor.withOpacity(0.5),
                        activeColor: ColorStyle.primaryColor,
                        inactiveTrackColor:
                            ColorStyle.greyColor.withOpacity(0.5),
                        inactiveThumbColor: ColorStyle.greyColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'مكالمات الفيديو',
                        style: TextStyleHelper.subtitle19.copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: ColorStyle.primaryColor.withOpacity(0.1),
                    child: SvgPicture.asset(
                      ImagesHelper.videoIcon,
                      color: ColorStyle.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100.h,
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      ColorStyle.greyColor.withOpacity(.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Transform.scale(
                      scale: 1.5, // Adjust the scale factor as needed
                      child: Switch(
                        value: controller.appNotifiValue.value,
                        onChanged: (bool value) {
                          controller.appNotifiSwitch();
                        },
                        activeTrackColor:
                            ColorStyle.primaryColor.withOpacity(0.5),
                        activeColor: ColorStyle.primaryColor,
                        inactiveTrackColor:
                            ColorStyle.greyColor.withOpacity(0.5),
                        inactiveThumbColor: ColorStyle.greyColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'إشعارات التطبيق',
                        style: TextStyleHelper.subtitle19.copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: ColorStyle.primaryColor.withOpacity(0.1),
                    child: SvgPicture.asset(
                      ImagesHelper.notificationIcon,
                      //color: ColorStyle.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
