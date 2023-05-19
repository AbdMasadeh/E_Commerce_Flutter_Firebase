import 'package:flutter/material.dart';

import 'package:final_project/widgets/text_styles.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              welcomeTextStyle("Welcome", 50, Colors.white),
              const SizedBox(height: 5),
              welcomeTextStyle("to", 50, Colors.white),
              const SizedBox(height: 10),
              Image.asset(
                "assets/images/logo.png",
                scale: 7,
              ),
              const SizedBox(height: 130),
              CustomElevatedButton(
                  buttonWidth: 140,
                  buttonHeight: 50,
                  text: "Get Started",
                  function: () {
                    Get.offNamed('/loginPage');
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText("Don't have an Account?", Colors.white, 18, false),
                  TextButton(
                      onPressed: () {
                        Get.offNamed('SignUpPage',preventDuplicates:false);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: customText("Sign Up", Colors.white, 18, true))
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
