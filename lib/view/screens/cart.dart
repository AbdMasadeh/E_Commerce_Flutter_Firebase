import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/widgets/cart/total_products.dart';
import 'package:final_project/widgets/cart/empty_cart.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cart/product_card.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: cartController.productsMap.isEmpty
              ? const EmptyCart()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              cartController.clearAllProducts();
                            },
                            child:
                                customText("Clear Cart", Colors.red, 15, true),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1500,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              productModel: cartController.productsMap.keys
                                  .toList()[index],
                              quantity: cartController.productsMap.values
                                  .toList()[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: cartController.productsMap.length,
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar:
              cartController.productsMap.isEmpty ? null : TotalProducts(),
        ),
      ),
    );
  }
}
