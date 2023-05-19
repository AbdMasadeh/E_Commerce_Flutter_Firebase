import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'text_styles.dart';

class SignBar extends StatelessWidget {
  const SignBar({Key? key, required this.text1, required this.text2, required this.routing}) : super(key: key);

  final String text1;
  final String text2;
  final String routing;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(text1, Colors.white, 18, false),
            TextButton(
                onPressed: () {
                  Get.offNamed(routing);
                },
                child: customText(text2, Colors.white, 18, true))
          ],
        ));
  }
}
