import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/model/PackagesModel.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import '../screens/edu_favorites_screens/controller/edu_favourites_controller.dart';
import '../screens/edu_favorites_screens/edu_favourite_screen1.dart';
import '../screens/packages_screen/controller/packages_controller.dart';
import 'customed_sized_button.dart';

class PackagesComponent extends StatelessWidget {
  PackagesComponent({Key? key}) : super(key: key);

  final packagesController = Get.put(PackagesController());
  final eduFavouritesController = EduFavouritesController();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: packagesController.getAllPackages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Container(
                height: 50.h,
                width: 50.w,
                child: CircularProgressIndicator(
                    color: ColorStyle.primaryColor
                )));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount:
                      packagesController.packagesModel.plans?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorStyle.greyColor.withOpacity(.3),
                            width: 1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'ساعة ',
                                  style: TextStyleHelper.body15,
                                  children: [
                                    TextSpan(
                                        text:
                                            '${packagesController.packagesModel.plans![index]?.totalHours}',
                                        style: TextStyleHelper.title22),
                                  ],
                                ),
                              ),
                              Text(
                                'صالحة لمدة 30 يوم',
                                style: TextStyleHelper.body15,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomSizedButton(
                                title:
                                    '${packagesController.packagesModel.plans![index]?.price} ريال  ',
                                size: const Size(140, 48),
                                onPressed: () {
                                  final packageId = packagesController.packagesModel.plans![index]?.id;
                                  packagesController.createNewSubscription(packageId: packageId! , context: context);
                                  // eduFavouritesController.goToHomeScreen();

                                },
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
                              //
                              // ClipRRect(
                              //     borderRadius: BorderRadius.circular(4.r),
                              //     child: Image.network(
                              //       "${packagesController.packagesModel.plans?[index].icon}",
                              //       fit: BoxFit.fill,
                              //     )),
                              //
                              SvgPicture.asset(
                                ImagesHelper.diamondIcon,
                                height: 64,
                                // color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                '${packagesController.packagesModel.plans?[index].name}',
                                style: TextStyleHelper.body15.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }
        });
  }
}
