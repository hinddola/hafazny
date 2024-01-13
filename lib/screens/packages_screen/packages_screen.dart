import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/components/packaes_component.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_sized_button.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../edu_favorites_screens/controller/edu_favourites_controller.dart';
import 'controller/packages_controller.dart';

class PackagesScreen extends StatelessWidget {
   PackagesScreen({super.key});

  final packagesController = Get.put(PackagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 90.h,
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'الباقات',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0.r),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              GetBuilder<PackagesController>(
                  builder: (packagesController){
                    return PackagesComponent() ;
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
