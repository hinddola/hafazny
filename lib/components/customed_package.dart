import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class CustomPackage extends StatelessWidget {

  final startDate =  HomeController().subscriptions.subscription?.startDate;
  final endDate = HomeController().subscriptions.subscription?.endDate;
  final totalHours = HomeController().subscriptions.subscription?.subscriptionDetail?.totalHours ;
  final remainingHours = HomeController().subscriptions.subscription?.subscriptionDetail?.remainingHours ;
  // double circularProgressIndicator_value = {totalHours -remainingHours} as double;

   CustomPackage({
    super.key,
  });

   final controller = Get.put(HomeController());
   ApiUrl apiUrl = ApiUrl();


   @override
  Widget build(BuildContext context) {
     return FutureBuilder(
         future: controller.getSubscriptions(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(child: Container(
                 height: 50.h,
                 width: 50.w,
                 child: CircularProgressIndicator(
                     color: ColorStyle.primaryColor
                 )));
           } else if (snapshot.hasError) {
             return Text('Error loading data');
           } else {
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
                       value: 1 ,
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
                           '${controller.userSubscriptions.userSubscriptions?[0].plan?.name}',
                           style: TextStyleHelper.subtitle17
                               .copyWith(fontWeight: FontWeight.bold),
                         ),
                         Text(
                             '${controller.userSubscriptions.userSubscriptions?[0].subscriptionDetail?.totalHours}',
                             style: TextStyleHelper.title22
                         ),
                         Text(
                           ' صالحة لمدة 30 يوم',
                           // 'صالحة لمدة 28 يوم',
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
                             'الساعات المتبقية',
                             style: TextStyleHelper.caption11.copyWith(
                                 color: const Color(
                                   0xff545F71,
                                 ),
                                 fontWeight: FontWeight.normal),
                           ),
                           Text(
                             '${controller.userSubscriptions.userSubscriptions?[0].subscriptionDetail?.remainingHours}',
                             //total hours -
                             // '28:00',
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
         });

  }
}
