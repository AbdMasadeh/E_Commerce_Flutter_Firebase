import 'package:final_project/constants/constants.dart';
import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../../logic/controller/main_controller.dart';

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Obx(() =>
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  // badgeAnimation: const badges.BadgeAnimation.slide(
                  // ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                  ),
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      mainController.currentIndex.value = 1;
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),)
              ],
              title: Row(
                children: [
                  const SizedBox(width: 100),
                  welcomeTextStyle('e-commerce', 30, Colors.blue),
                ],
              ),
              // centerTitle: true,
              backgroundColor: Get.isDarkMode ? Colors.grey : mainColor,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: mainColor,
              currentIndex: mainController.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
              onTap: (index) {
                mainController.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: mainController.currentIndex.value,
              children: mainController.tabs,
            ),
          );
        },
      ),
    );
  }
}
