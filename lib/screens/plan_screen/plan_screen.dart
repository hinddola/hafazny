import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafazny/screens/plan_screen/adding_new_plan_first_screen.dart';

import '../../components/customed_back_arrow.dart';
import '../../const/style.dart';

class PlanScreen extends StatefulWidget {
  PlanScreen ({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}


class _PlanScreenState extends State<PlanScreen> {
  @override
  void initState() {
    Timer(
        const Duration (seconds: 3), (){
      Navigator.pushReplacement(
          context ,
          MaterialPageRoute(
            builder: (context) => AddingNewPlanFirstScreen(),
          )
      );
    }
    );
    super.initState();
  }


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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 40.h,),
              Image.asset(
                'assets/images/planning (1) 1.png',
              ),
              SizedBox(height: 20.h,),
              Text(
                'لم يتم العثور على خطط',
                style:
                TextStyleHelper.subtitle19.copyWith(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h,),
              Text(
                'يمكنك إضافة خطط تعلم جديدة',
                style: TextStyleHelper.body15
                    .copyWith(
                  color: ColorStyle.lightNavyColor ,
                  fontSize: 20.sp
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
