import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/customed_back_arrow.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'الاشعارات',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0.r),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              10,
                  (index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(.1),
                          width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'موعد حجزك اليوم مع محمد على ابراهيم بعد 30 دقيقة لا تنسى ذلك',
                              style: TextStyleHelper.body15
                                  .copyWith(fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,

                            ),
                            Text(
                              'منذ 10 دقائق',
                              style: TextStyleHelper.button13.copyWith(
                                fontWeight: FontWeight.w300,
                                color: ColorStyle.lightNavyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SvgPicture.asset(
                          ImagesHelper.notificationIcon,
                          color: ColorStyle.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
