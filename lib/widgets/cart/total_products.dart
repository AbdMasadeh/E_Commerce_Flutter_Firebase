import 'package:final_project/constants/constants.dart';
import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalProducts extends StatelessWidget {
  TotalProducts({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(5),
        height: 75,
        padding: const EdgeInsets.all(7),
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText('Total Price', mainColor!, 20, false),
                const SizedBox(height: 5),
                customText(
                    '\$ ${cartController.total}', Colors.black, 17, false),
              ],
            ),
            const SizedBox(width: 50),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomElevatedButton(
                  buttonWidth: 110,
                  buttonHeight: 50,
                  function: () {},
                  childWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_outlined),
                      const SizedBox(width: 20),
                      customText('Check Out', Colors.white, 20, false)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
