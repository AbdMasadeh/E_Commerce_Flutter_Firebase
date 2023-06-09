import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/logic/controller/product_controller.dart';
import 'package:final_project/view/screens/product_details.dart';
import 'package:final_project/widgets/home/search.dart';
import 'package:final_project/widgets/home/card_item.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeTextStyle("Discover!", 25, Colors.white),
                    const SizedBox(width: 30),
                    welcomeTextStyle(" Add to Cart", 25, Colors.white),
                  ],
                ),
                welcomeTextStyle("Wait for the Shipment", 25, Colors.white),
                SearchField(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: customText("Categories", Colors.black, 20, false)),
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/categoryPage');
              },
              child: const Text("Category")),
          CardItem(),
        ],
      ),
    ));
  }
}
