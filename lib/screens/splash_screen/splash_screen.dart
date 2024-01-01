import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>   with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    splashAnimation();
  }

// function that controls animation of logo
  void splashAnimation() {
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..forward()..repeat();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () async {
          Get.to(OnBoardingScreen());
        }),
        builder: (context, snapshot) {
          return Scaffold(
            body:Center(
              child: Lottie.asset(
                  'assets/images/splash.json',
                  //   fit: BoxFit.contain,color: Colors.white,
                  animate: true,
                  controller: controller
              ),
            ),
            /*  FadeTransition(
              opacity: animation,
              child:
            ), */
          );
        });
  }
}
