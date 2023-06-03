import 'package:final_project/constants/constants.dart';
import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/model/product_model.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.productModel,
      required this.quantity,
      required this.index})
      : super(key: key);

  final ProductModel productModel;
  final int quantity;
  final int index;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: mainColor!.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //* for the Image
          Container(
            height: 130,
            width: 100,
            padding: const EdgeInsets.fromLTRB(1, 2, 2, 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          //* For the Product name and price
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 60,
                  width: 130,
                  child:
                      customText(productModel.title, Colors.black, 18, false)),
              const SizedBox(height: 20),
              SizedBox(
                width: 138,
                height: 30,
                child: customText(
                    "\$ ${productModel.price} - \$ ${cartController.productSubTotal[index].toStringAsFixed(2)}",
                    Colors.black,
                    16,
                    false),
              ),
            ],
          ),
          //* For the (+), (-) buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.removeProductsFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 26,
                    child: Text(
                      "$quantity",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.increaseItemCount(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: 110,
                height: 50,
                alignment: Alignment.center,
                color: mainColor?.withOpacity(0.2),
                margin: const EdgeInsets.fromLTRB(10, 0, 2, 2),
                child: TextButton(
                  onPressed: () {
                    cartController.removeOneProduct(productModel);
                  },
                  child: customText(
                      'Delete item\nfrom cart', Colors.red[900]!, 12, false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
