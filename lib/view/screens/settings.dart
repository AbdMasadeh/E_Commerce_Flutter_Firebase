import 'package:final_project/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../logic/controller/auth_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  ThemeController().changeTheme();
                },
                icon: const Icon(Icons.dark_mode)),
            GetBuilder<AuthController>(builder: (controller) {
              return IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Log ut",
                      middleText: "Are you sure you want to log out?",
                      textCancel: "NO",
                      textConfirm: "Yes",
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () {
                        controller.signOutFirebase();
                      });
                },
                icon: const Icon(Icons.logout_outlined),
              );
            }),
          ],
        ),
      ),
    );
  }
}
