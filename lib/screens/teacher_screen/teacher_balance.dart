import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';

class TeacherBalance extends StatelessWidget {
  TeacherBalance ({Key? key}) : super(key: key);

  TextEditingController payPalController = TextEditingController();
  TextEditingController ammountController = TextEditingController();

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
                    'الرصيد الإجمالي',
                      style:
                      TextStyleHelper.subtitle19.copyWith(
                        fontSize: 24.sp,
                        color: ColorStyle.whiteColor
                      )
                  ),
                  Text(
                    '00.00 \$',
                      style:
                      TextStyleHelper.subtitle19.copyWith(
                          fontSize: 32.sp,
                          color: ColorStyle.whiteColor
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomFormField(
                isLabeled: true,
                labelText: '   Paypal حسابك في ',
                hintText: 'Info@gmail.com',
                keyboardType: TextInputType.emailAddress,
                controller: payPalController),
            SizedBox(
              height: 10.h,
            ),
            CustomFormField(
                isLabeled: true,
                labelText: '   المبلغ المطلوب سحبه ',
                hintText: '00.0',
                keyboardType: TextInputType.number,
                controller: ammountController
            ),
            Spacer(),
            CustomButton(
                onPressed: (){},
                text: 'سحب الرصيد'
            ),
          ],
        ),
      ),
    );
  }
}
