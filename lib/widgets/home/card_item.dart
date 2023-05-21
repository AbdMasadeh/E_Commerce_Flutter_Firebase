import 'package:final_project/model/product_model.dart';
import 'package:flutter/material.dart';

import 'package:final_project/constants/constants.dart';
import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:get/get.dart';
import '../../logic/controller/product_controller.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: productController.productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                image: productController.productList[index].image,
                price: productController.productList[index].price,
                rate: productController.productList[index].rating.rate,
                productModel: productController.productList[index],
              );
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required ProductModel productModel,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            //* This refers to the text above
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      customText("$rate", Colors.black, 15, false),
                      const Icon(Icons.star_border),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModel);
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                  )
                ],
              ),
            ),
            //* This refers to the image inside
            Container(
              margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            //* This refers to the text below
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
              child: customText("Price: $price \$", Colors.black, 15, false),
            )
          ],
        ),
      ),
    );
  }
}
