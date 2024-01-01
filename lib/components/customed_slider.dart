//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
//
// //import '../network/end_points.dart';
// import 'customed_dots.dart';
//
// class CustomSlider extends StatefulWidget {
//   const CustomSlider({super.key});
//
//   @override
//   State<CustomSlider> createState() => _CustomSliderState();
// }
//
// class _CustomSliderState extends State<CustomSlider> {
//
//   final homeController = Get.put(HomeController());
//
//   int currentImage = 0;
//
//   final PageController _pageController =
//   PageController(initialPage: 0, viewportFraction: 1);
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//         currentImage = _pageController.page!.round();
//         homeController.update();
//     });
//     Future.delayed(const Duration(seconds: 2), () {
//       _animateSlider();
//       homeController.update();
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _animateSlider();
//     super.dispose();
//     homeController.update();
//   }
//
//   void _animateSlider() {
//     if (currentImage < homeController.imageSlider.length - 1) {
//       currentImage++;
//       homeController.update();
//     } else {
//       currentImage = 0;
//     }
//     if (mounted) {
//       _pageController.animateToPage(
//         currentImage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.ease,
//       );
//       homeController.update();
//     }
//
//     Future.delayed(const Duration(seconds: 2), () {
//       _animateSlider();
//       homeController.update();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GetBuilder<HomeController>(
//           builder: (homeController) {
//             // if (state is HomeLoading) {
//             //   return const Center(child: CircularProgressIndicator());
//             // }
//             // else if (state is HomeError) {
//             //   return const Center(child: Text('error'));
//             // } else {
//               return Container(
//                 height: 10.h,
//                 width: 10.w,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: homeController.imageSlider.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return AnimatedBuilder(
//                       animation: _pageController,
//                       builder: (BuildContext context, Widget? widget) {
//                         double value = 1.0;
//                         if (_pageController.position.haveDimensions) {
//                           value = _pageController.page! - index;
//                           value = (1 - (value.abs() * 0.1)).clamp(0.0, 2.0);
//                         }
//                         return Center(
//                           child: SizedBox(
//                             height: Curves.easeOut.transform(value) *
//                                 50.h,
//                             width: Curves.easeOut.transform(value) *
//                                 100.w,
//                             child: Container(
//                               padding: const EdgeInsets.all(
//                                   0), // Remove padding around the image
//                               child: widget,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 3.0.r),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(4.r),
//                           child: Image.network(
//                             // ApiNames.baseUrl +
//                             //     ApiNames.sliderImagesPath +
//                                 homeController.imageSlider[index].imageName!,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }
//
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             homeController.imageSlider.length,
//                 (index) => CustomDots(
//               width: .045,
//               color: currentImage == index
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.grey,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
