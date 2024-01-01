import 'package:get/get.dart';

class SessionController extends GetxController{

  RxDouble sliderValue= 50.0.obs;

  List<Map<String, dynamic>> content = [
    {
      'subTitle': 'مكتمل',
      'title': 'السجل',
    },
    {
      'subTitle': '5.8',
      'title': 'عدد الأوجة المنجزة',
    },
    {
      'subTitle': '34',
      'title': 'أخطاء الكلمات',
    },
    {
      'subTitle': '45',
      'title': 'التردد',
    },
    {
      'subTitle': '1',
      'title': 'أخطاء التجويد',
    },
  ];

}