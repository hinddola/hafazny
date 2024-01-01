import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafazny/components/customed_package.dart';
import 'package:hafazny/components/percentage_component.dart';
import 'package:hafazny/components/plan_detailes_card.dart';
import 'package:hafazny/helper/image_helper.dart';

import '../../components/active_avatar.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../const/style.dart';

class SavePlanScreen extends StatelessWidget {
  SavePlanScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'الخطة',
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
            Column(
              children: List.generate(
                2,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    //titleAlignment: ListTileTitleAlignment.center,
                    minVerticalPadding: 15,
                    //  contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    horizontalTitleGap: 8,
                    leading: GestureDetector(
                      child: SvgPicture.asset(
                        ImagesHelper.deleteIcon
                      ),
                    ),
                    contentPadding: const EdgeInsetsDirectional.only(start: 15),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                        ' اسم الخطة',
                          style:
                          TextStyleHelper.subtitle19.copyWith(
                            fontSize: 18.sp
                          ),
                        ),
                      ],
                    ),
                            Row(
                              children: [
                                Text(
                                  '40.0%',
                                  style: TextStyleHelper.caption11.copyWith(
                                    fontSize: 16.sp
                                  ),
                                ),
                                SizedBox(width: 50.w,),
                                Text(
                                  'مراجعة',
                                  style: TextStyleHelper.caption11.copyWith(
                                      color: ColorStyle.primaryColor,
                                      fontSize: 16.sp
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'من جزء 1 الى جزء 2 ',
                                  style: TextStyleHelper.caption11.copyWith(
                                    fontSize: 16.sp
                                  ),
                                ),
                                SizedBox(width: 50.w,),
                                Text(
                                  'الترتيب',
                                  style: TextStyleHelper.caption11.copyWith(
                                      color: ColorStyle.primaryColor,
                                    fontSize: 16.sp
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    trailing: PercentageComonent(),

                  ),
                ),
              ),

            ),
            Spacer(),
            CustomButton(
              onPressed: () {},
              text: 'إضافة خطة',
            ),
          ],
        ),
      ),
    );
  }
}
