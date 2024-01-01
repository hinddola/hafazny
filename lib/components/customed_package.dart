import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class CustomPackage extends StatelessWidget {
   CustomPackage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      //color: Colors.green,
      width: 300.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120.h,
            width: 120.h,
            child: const CircularProgressIndicator(
              semanticsLabel: '50%',
              color: ColorStyle.skipTextColor,
              backgroundColor: Colors.white,
              //strokeAlign: -1,
              strokeWidth: 80,
              value: .9,
            ),
          ),
          Container(
            height: 170.h,
            width: 170.h,
            padding: EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
                color: ColorStyle.whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.r,
                    offset: const Offset(0, 0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الباقة الفضية',
                  style: TextStyleHelper.subtitle17
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('30:00', style: TextStyleHelper.title22),
                Text(
                  'صالحة لمدة 28 يوم',
                  style: TextStyleHelper.caption11,
                ),
                 SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Positioned(
            top:0 ,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: ColorStyle.skipTextColor,
              child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    ImagesHelper.diamondIcon,
                    height: 35.h,
                    width: 35.h,
                    /*   color: Colors.white, */
                  )
                //    backgroundImage: AssetImage('assets/images/1.jpg'),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              height: 60.h,
              width: 130.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.r,
                    offset: const Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'الدقائق المتبقية',
                    style: TextStyleHelper.caption11.copyWith(
                        color: const Color(
                          0xff545F71,
                        ),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '28:00',
                    style: TextStyleHelper.subtitle17.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
