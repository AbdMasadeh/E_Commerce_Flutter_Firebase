import 'package:final_project/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:final_project/widgets/text_styles.dart';
import 'package:get/get.dart';
import '../logic/controller/product_controller.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

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
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  image: productController.productList[index].image,
                  price: productController.productList[index].price,
                  rate: productController.productList[index].rating.rate);
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems(
      {required String image, required double price, required double rate}) {
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
            Container(
              margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText("Price: $price \$", Colors.black, 15, false),
                 customText("$rate", Colors.black, 15, false),
                  const Icon(Icons.star_border),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.add_shopping_cart_outlined),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
