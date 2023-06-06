import 'package:final_project/logic/bindings/product_bindings.dart';
import 'package:final_project/view/screens/cart.dart';
import 'package:final_project/view/screens/category.dart';
import 'package:get/get.dart';
import 'package:final_project/logic/bindings/auth_bindings.dart';
import 'package:final_project/logic/bindings/main_bindings.dart';
import 'package:final_project/view/screens/authentication/login.dart';
import 'package:final_project/view/screens/authentication/sign_up.dart';
import 'package:final_project/view/screens/welcome.dart';
import '../view/screens/main_page.dart';

appRoutes() => [
      GetPage(
        name: '/welcomePage',
        page: () => const WelcomePage(),
      ),
      GetPage(
        name: '/loginPage',
        page: () => LoginPage(),
        binding: AuthBinding(),
      ),
      GetPage(
        name: '/SignUpPage',
        page: () => SignUpPage(),
        binding: AuthBinding(),
      ),
      GetPage(
        name: '/mainPage',
        page: () => Main(),
        bindings: [AuthBinding(), MainBinding(), ProductBinding()],
      ),
      GetPage(
        name: '/cartPage',
        page: () => CartPage(),
        bindings: [AuthBinding(), ProductBinding()],
      ),
      GetPage(
        name: '/categoryPage',
        page: () => CategoryPage(),
        bindings: [],
      ),
    ];
