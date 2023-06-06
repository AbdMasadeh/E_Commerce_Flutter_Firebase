import 'package:final_project/logic/controller/theme_controller.dart';
import 'package:final_project/model/user_model.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/auth_controller.dart';
import '../../widgets/settings/info_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InformationCard(
              child: Text(getUserFirstName()!),
            ),
            InkWell(
              onTap: () {
                ThemeController().changeTheme();
              },
              child: InformationCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Change Theme Mode", Colors.white, 20, false),
                    const Icon(Icons.dark_mode),
                  ],
                ),
              ),
            ),
            GetBuilder<AuthController>(builder: (controller) {
              return InformationCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Logout", Colors.white, 20, false),
                    IconButton(
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
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
