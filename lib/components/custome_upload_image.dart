import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helper/image_helper.dart';
import '../screens/profile_screen/controller/profile_controller.dart';

class CustomUploadImage extends StatelessWidget {
  CustomUploadImage({
    Key? key,
  }) : super(key: key);

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: controller.imageList.isEmpty
                  ? SvgPicture.asset(ImagesHelper.uploadIcon)
                  : Container(
                    width: 140.w,
                    height: 140.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                   child: ClipOval(
                     child: Image.file(
                       controller.imageList.first,
                       fit: BoxFit.cover, // Use BoxFit.cover to make the image fit inside the circle
                     ),
                   ),
                  ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () async {
                  await controller.getImages();
                },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.grey.shade300,
                    child: SvgPicture.asset(
                      ImagesHelper.uploadImageIcon,
                      height: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
