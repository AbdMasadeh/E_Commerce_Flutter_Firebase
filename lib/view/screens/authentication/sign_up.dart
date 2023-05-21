import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/sign_bar.dart';
import 'package:final_project/constants/constants.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../services/validation.dart';
import '/widgets/text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final authKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController secPasswordController = TextEditingController();

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
                          "UP",
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
                        valid: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid User name';
                          } else {
                            return null;
                          }
                        }),
                    CustomTextField(
                        controller: firstNameController,
                        icon: const Icon(Icons.drive_file_rename_outline_sharp),
                        hint: "First Name",
                        sufIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(null),
                        ),
                        hideText: false,
                        action: TextInputAction.next,
                        valid: (value) {
                          if (value.toString().isEmpty) {
                            return "First Name cannot be empty";
                          }
                        }),
                    CustomTextField(
                      controller: lastNameController,
                      icon: const Icon(Icons.drive_file_rename_outline_sharp),
                      hint: "Last Name",
                      sufIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(null),
                      ),
                      hideText: false,
                      action: TextInputAction.next,
                      valid: (value) {
                        if (value.toString().isEmpty) {
                          return "Last Name cannot be empty";
                        }
                      },
                    ),
                    CustomTextField(
                      controller: emailController,
                      icon: const Icon(Icons.email_outlined),
                      hint: "Email",
                      sufIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(null),
                      ),
                      hideText: false,
                      action: TextInputAction.next,
                      valid: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextField(
                      controller: dateController,
                      icon: const Icon(Icons.date_range_outlined),
                      sufIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(null),
                      ),
                      hint: "Date of Birth",
                      hideText: false,
                      action: TextInputAction.next,
                      valid: (value) {
                        if (value.toString().isEmpty) {
                          return "Invalid Date";
                        }
                      },
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
                        action: TextInputAction.next,
                        valid: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
                    CustomTextField(
                      controller: secPasswordController,
                      icon: const Icon(Icons.password),
                      hint: "Confirm Password",
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
                      valid: (value) {
                        if (secPasswordController.text ==
                            passwordController.text) {
                          return null;
                        } else {
                          return 'Passwords don\'t match';
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomElevatedButton(
                          buttonWidth: 140,
                          buttonHeight: 50,
                          function: () {
                            if (authKey.currentState!.validate()) {
                              String userName = userNameController.text.trim();
                              String firstName =
                                  firstNameController.text.trim();
                              String lastName = lastNameController.text.trim();
                              String email = emailController.text.trim();
                              String date = dateController.text.trim();
                              String password = passwordController.text;
                              controller.signUpFirebase(
                                userName: userName,
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                date: date,
                                password: password,
                              );
                            }
                          }, childWidget: customText("Sign Up", Colors.white, 20, false),);
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SignBar(
                  text1: "Already have Account?",
                  text2: "Sign in",
                  routing: 'loginPage'),
            ],
          ),
        ),
      ),
    );
  }
}
