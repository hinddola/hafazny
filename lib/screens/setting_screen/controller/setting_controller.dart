import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool audioValue = true.obs;
  RxBool videoValue = true.obs;
  RxBool appNotifiValue = false.obs;

  void audioToggleSwitch() {
    audioValue.value = !audioValue.value;
  }
  void videoToggleSwitch() {
    videoValue.value = !videoValue.value;
  }
  void appNotifiSwitch() {
    appNotifiValue.value = !appNotifiValue.value;
  }
}
