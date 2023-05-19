import 'package:final_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/main_controller.dart';

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              title: const Text("E-Commerce"),
              // controller.title[controller.currentIndex.value]
              centerTitle: true,
              backgroundColor: Get.isDarkMode ? Colors.grey : mainColor,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: mainColor,
              currentIndex: controller.currentIndex.value,
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
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
