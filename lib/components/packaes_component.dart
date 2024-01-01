import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import 'customed_sized_button.dart';

class PackagesComponent extends StatelessWidget {
  PackagesComponent ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(
            color:ColorStyle.greyColor
                .withOpacity(.3),
            width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text.rich(
                TextSpan(
                  text: 'دقيقة',
                  style: TextStyleHelper.body15 ,
                  children: [
                    TextSpan(
                        text: ' 130',
                        style: TextStyleHelper.title22),
                  ],
                ),
              ),
              Text(
                'صالحة لمدة 180 يوم',
                style: TextStyleHelper.body15,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomSizedButton(
                title: '300 ريال',
                size: const Size(140, 48),
                onPressed: () {},
                textStyle: TextStyleHelper.title22
                    .copyWith(color: ColorStyle.whiteColor),
              )
            ],
          ),
          SizedBox(width: 140.w),
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SvgPicture.asset(
                ImagesHelper.diamondIcon,
                height: 64,
                // color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                'الباقة الفضية',
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
