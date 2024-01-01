import 'package:get/get.dart';

class OnBoardingController extends GetxController{

  int currentPage = 0;
  int currentContent = 0;
  bool isStudent = false;
  int? roleId;

  List<OnBoardingModel> content = [
    OnBoardingModel(
        title: 'حفظنى معك فى تعلم القرآن',
        description:
        'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: 'assets/images/on_boarding1.png'
    ),
    OnBoardingModel(
        title: 'اكثر من معلم ومعلمة',
        description:
        'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: 'assets/images/on_boarding2.png'
    ),
    OnBoardingModel(
        title: 'مختلف الاعمار والمستويات',
        description:
        'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: 'assets/images/on_boarding3.png'
    ),
  ];

}

class OnBoardingModel {
  final String title;
  final String description;
  final String? image;

  OnBoardingModel({
    required this.title,
    required this.description,
    this.image
  });
}