import 'package:final_project/constants/constants.dart';
import 'package:final_project/logic/controller/cart_controller.dart';
import 'package:final_project/model/product_model.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            productModel.title,
            style: const TextStyle(color: Colors.black),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: mainColor),
                child: const Icon(Icons.arrow_back_ios_outlined)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 400,
                  height: 400,
                  child: Image.network(productModel.image)),
              Container(
                padding: const EdgeInsets.fromLTRB(4, 5, 0, 0),
                height: 60,
                child: customText("Category:\n ${productModel.category}",
                    Colors.black, 20, false),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(4, 2, 0, 0),
                  width: 400,
                  height: 80,
                  // color: Colors.red,
                  child:
                      customText(productModel.title, Colors.black, 25, false)),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 0, 0),
                      width: 170,
                      height: 40,
                      // color: Colors.blue,
                      child: customText("Price: ${productModel.price} \$",
                          Colors.black, 20, false)),
                  const SizedBox(width: 60),
                  Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 0, 0),
                      width: 100,
                      height: 40,
                      // color: Colors.red,
                      child: customText("Rating: ${productModel.rating.rate}",
                          Colors.black, 20, false)),
                  const Icon(Icons.star)
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(4, 2, 0, 5),
                child: customText("Description:\n${productModel.description}",
                    Colors.black, 20, false),
              ),
              Center(
                child: CustomElevatedButton(
                    buttonWidth: 200,
                    buttonHeight: 50,
                    function: () {
                      cartController.addProductToCart(productModel);
                      Get.back();
                    },
                    childWidget:
                        customText("Add to Cart", Colors.white, 20, false)),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
