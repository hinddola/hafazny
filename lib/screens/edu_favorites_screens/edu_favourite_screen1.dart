import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hafazny/const/style.dart';
import '../../components/customed_button.dart';
import '../../components/customed_dots.dart';
import '../../components/radio_container.dart';
import '../../model/PathModel.dart';
import 'controller/edu_favourites_controller.dart';

class EduFavouriteFirstScreen extends StatelessWidget {
  late final item;
  final EduFavouritesController controller = Get.put(EduFavouritesController());
  PathModel pathModel = PathModel();

  bool? isSecondPage ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<EduFavouritesController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20.h),
                  Text(
                    'تفضيلاتي التعليمية',
                    style: TextStyle(
                      color: ColorStyle.navyColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'يساعدك تحديد هذه المعلومات على تجربة تعليمية مناسبة لك وتسهيل الوصول لمعلم القران المناسب',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorStyle.textColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: FutureBuilder<void>(
                      future: controller.getPaths(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error loading data'));
                        } else {
                          return Obx(() => SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${controller.pathsList[controller.currentItem.value].title}',
                                  style: TextStyle(
                                    color: ColorStyle.navyColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: controller.pathsList[controller.currentItem.value].pathItems?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final pathItem = controller.pathsList[controller.currentItem.value].pathItems![index];
                                  return RadioComponent(
                                    isSecScreen: false,
                                    title: pathItem.title,
                                    description: pathItem.description,
                                    value: pathItem.id,
                                    controller: controller,
                                  );
                                },
                              ),
                            ),

                              ],
                            ),
                          ));

                        }
                      },
                    ),
                  ),
                  //(controller.currentItem.value+1) == (controller.pathsList.length)
                  Obx(() => controller.lastPath.value == true
                      ? CustomButton(
                        onPressed: () {
                          if (controller.selectedValue.value != 0){
                            controller.goToHomeScreen();
                          } else {
                            Get.snackbar('You must select one of items', '',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                        child: Text(
                          'حفظ التفضيلات',
                          style: TextStyleHelper.button16.copyWith(
                            color: ColorStyle.whiteColor,
                          ),
                        ),
                      )
                      : Column(
                        children: [
                          CustomButton(
                                background: ColorStyle.primaryColor,
                                onPressed: () {
                                  if (controller.pathsList.isNotEmpty) {
                                    final currentPath = controller.pathsList[controller.currentItem.value];
                                    if (controller.selectedValue.value != 0){
                                      controller.goToNextPath();
                                    } else {
                                      Get.snackbar('You must select one of items', '',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  }
                                },

                                child: Text(
                                  'التالي',
                                  style: TextStyleHelper.button16.copyWith(
                                    color: ColorStyle.whiteColor,
                                  ),
                                ),
                              ),
                        ],
                      ))

              ],
              );
            },
          ),
        ),
      ),
    );
  }

}