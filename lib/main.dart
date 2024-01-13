import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hafazny/const/style.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/screens/loading_screen/loading_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferanceHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: ScreenUtilInit(
        designSize: const Size(450, 926),
        builder: (BuildContext ,Widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cairo',
            primaryColorLight: ColorStyle.primaryColor,
          ),
          home : LoadingScreen(),
        ),
      ),
    );
  }
}
