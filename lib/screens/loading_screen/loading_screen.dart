import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/style.dart';
import '../../model/LoginModel.dart';
import '../auth_screens/controller/auth_controller.dart';
import '../nav_bar_screen/nav_bar_screen.dart';
import '../splash_screen/splash_screen.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthController().checkUser(),
      builder: (context, AsyncSnapshot<LoginModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If the Future is still running, show a loading indicator
          return CircularProgressIndicator(color: ColorStyle.primaryColor,);
        } else if (snapshot.hasError) {
          // If an error occurred while fetching user data, handle it
          print(snapshot);
          return Column(
            children: [
              // Display any error message or UI you want to show in case of an error
              Text('Error loading user data ${snapshot.error}'),
            ],
          );
        } else {
          if (snapshot.data?.token != null) {
            return NavBarScreen(currentIndex: 4);
          } else {
            return SplashScreen();
          }
        }
      },
    );
  }
}
