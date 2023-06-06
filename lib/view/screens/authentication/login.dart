import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/sign_bar.dart';
import 'package:final_project/constants/constants.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final authKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                "assets/images/logo.png",
                scale: 15,
              ),
              const SizedBox(height: 30),
              Form(
                key: authKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "SIGN ",
                          style: TextStyle(color: mainColor, fontSize: 30),
                        ),
                        const Text(
                          "IN",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: userNameController,
                      icon: const Icon(Icons.account_circle_rounded),
                      sufIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(null),
                      ),
                      hint: "User Name",
                      hideText: false,
                      action: TextInputAction.next,
                      valid: (value) {},
                      change: () {},
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomTextField(
                        controller: passwordController,
                        icon: const Icon(Icons.password),
                        hint: "Password",
                        sufIcon: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          icon: controller.isVisibility
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hideText: controller.isVisibility ? false : true,
                        action: TextInputAction.done,
                        valid: (value) {},
                        change: () {},
                      );
                    }),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('forgotPassword');
                      },
                      child:
                          customText('Forgot Password?', textColor, 15, false),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomElevatedButton(
                          buttonWidth: 140,
                          buttonHeight: 50,
                          childWidget:
                              customText("Sign In", Colors.white, 20, false),
                          function: () {
                            if (authKey.currentState!.validate()) {
                              String email = userNameController.text.trim();
                              String password = passwordController.text;
                              controller.signInFirebase(
                                password: password,
                                email: email,
                              );
                            }
                          });
                    }),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
              const SignBar(
                  text1: "Don't have an Account?",
                  text2: "Sign Up",
                  routing: 'SignUpPage'),
            ],
          ),
        ),
      ),
    );
  }
}
