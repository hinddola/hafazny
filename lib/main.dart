import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hafazny/components/percentage_component.dart';
import 'package:hafazny/components/session_detailes_card.dart';
import 'package:hafazny/components/student_detailes_card.dart';
import 'package:hafazny/components/teacher_rate.dart';
import 'package:hafazny/const/style.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/screens/auth_screens/forget_password_screen/forget_password_screen.dart';
import 'package:hafazny/screens/auth_screens/login_screen/login_screen.dart';
import 'package:hafazny/screens/auth_screens/new_password_screen/new_password_screen.dart';
import 'package:hafazny/screens/auth_screens/otp_screen/otp_screen.dart';
import 'package:hafazny/screens/auth_screens/register_screen/register_screen.dart';
import 'package:hafazny/screens/edu_favorites_screens/edu_favourite_screen1.dart';
import 'package:hafazny/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:hafazny/screens/splash_screen/splash_screen.dart';
import 'package:hafazny/screens/teacher_screen/teacher_complete_data_first_screen.dart';
import 'package:hafazny/screens/teacher_screen/teacher_complete_data_sec_screen.dart';
import 'helper/shared_handeller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferanceHelper.init();
  //Network.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: ScreenUtilInit(
        designSize: const Size(450, 926),
        builder: (BuildContext ,Widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Cairo',
            primaryColor: ColorStyle.primaryColor,
          ),
          home:OnBoardingScreen(),
        ),
      ),
    );
  }
}
