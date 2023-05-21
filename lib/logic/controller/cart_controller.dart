import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../model/product_model.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      // productsMap[productModel] += 1;
    } else {
      productsMap[productModel] = 1;
    }
  }

  void increaseItemCount(ProductModel productModel) {
    // if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
    // } else {
    //   productsMap[productModel] = 1;
    // }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] <= 1 ? 1 : productsMap[productModel] -= 1;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clear Cart",
      middleText:
          'Are you sure you want to remove all the products from your Cart?',
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    return productsMap.isEmpty
        ? 0
        : productsMap.entries
            .map((e) => e.value)
            .toList()
            .reduce((value, element) => value + element);
  }
}
