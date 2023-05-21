import 'package:final_project/constants/constants.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.shopping_cart_rounded,
            size: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText("You Cart is ", Colors.black, 40, false),
              customText("Empty", mainColor!, 45, false)
            ],
          ),
          const SizedBox(height: 50),
          customText("Go to Home Page", Colors.grey, 20, false),
          customText("and make your first purchase", Colors.grey, 20, false),
          const SizedBox(height: 15),
          // CustomElevatedButton(
          //     buttonWidth: 200,
          //     buttonHeight: 50,
          //     text: "Go to Home Page",
          //     function: () {
          //       Get.back();
          //     }),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
