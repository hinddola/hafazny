import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../const/style.dart';
import 'customed_dots.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  final homeController = Get.put(HomeController());

  int currentImage = 0;


  final PageController _pageController =
  PageController(initialPage: 0, viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
        currentImage = _pageController.page!.round();

    });
    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();

    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    //_animateSlider();
    super.dispose();
    homeController.homeImageSlider;


  }

  void _animateSlider() {
    if (currentImage < (homeController.homeImageSlider.homeSliders?.length)! - 1) {
      currentImage++;
      homeController.update();
    } else {
      currentImage = 0;
    }
    if (mounted) {
      _pageController.animateToPage(
        currentImage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      homeController.update();
    }

    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();
      homeController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<HomeController>(
          builder: (homeController) {
              return Container(
                width: 400.w,
                height: 190.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: homeController.homeImageSlider.homeSliders?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (BuildContext context, Widget? widget) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - index;
                          value = (1 - (value.abs() * 0.1)).clamp(0.0, 2.0);
                        }
                        return Center(
                          child: Container(
                            height: Curves.easeOut.transform(value) *
                                200.h,
                            width: Curves.easeOut.transform(value) *
                                450.w,
                            child: Container(
                              child: widget,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.network(
                              "${homeController.homeImageSlider.homeSliders?[index].image}" ,
                          fit: BoxFit.fill,
                          //fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                ),
              );
            }

        ),
        SizedBox(
          height: 20.h,
        ),
        GetBuilder<HomeController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                  activeIndex: currentImage,
                  count: controller.homeImageSlider.homeSliders?.length as int ,
                  effect: ExpandingDotsEffect(
                      dotHeight: 5,
                      dotWidth: 5,
                      activeDotColor: ColorStyle.primaryColor,
                      dotColor: ColorStyle.greyColor.withOpacity(0.5)
                  ),
              ),

            ],

          ),
        ),
      ],
    );
  }
}
