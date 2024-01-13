import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../components/customed_sized_button.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class StudentSubscriptionsScreen extends StatelessWidget {
  StudentSubscriptionsScreen ({Key? key}) : super(key: key);

  // TextEditingController payPalController = TextEditingController();
  // TextEditingController ammountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'الرصيد',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            SizedBox(height: 10.h,),
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor,
                border: Border.all(
                    color:ColorStyle.greyColor
                        .withOpacity(.3),
                    width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'الساعات المتبقية',
                      style:
                      TextStyleHelper.subtitle19.copyWith(
                          fontSize: 24.sp,
                          color: ColorStyle.whiteColor
                      )
                  ),
                  Text(
                      '90.00 ',
                      style:
                      TextStyleHelper.subtitle19.copyWith(
                          fontSize: 32.sp,
                          color: ColorStyle.whiteColor
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'الباقات المشترك بها' ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorStyle.greyColor.withOpacity(.3),
                    width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [

                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        '130 ساعة',
                        style: TextStyleHelper.body15.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Text(
                        'صالحة لمدة 30 يوم',
                        style: TextStyleHelper.body15.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        width: 20.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'فعالة',
                            style: TextStyleHelper.body15.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: ColorStyle.primaryColor,
                          ),
                        ],
                      ),

                    ],
                  ),



                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      SvgPicture.asset(
                        ImagesHelper.diamondIcon,
                        height: 30,
                        // color: Theme.of(context).colorScheme.primary,
                      ),

                      Text(
                          '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

          ],
        ),
      ),
    );
  }
}
