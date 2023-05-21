import 'package:get/get.dart';
import 'package:final_project/view/screens/cart.dart';
import 'package:final_project/view/screens/settings.dart';
import '../../view/screens/home.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomePage(),
    CartPage(),
    SettingsPage(),
  ].obs;
}
