import 'package:get/instance_manager.dart';

import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    // Get.put(SettingController());
    // Get.put(PayMentController(), permanent: true);
  }
}
