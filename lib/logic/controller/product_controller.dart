import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:final_project/services/product_services.dart';

import '../../model/product_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favouritesList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShopping = storage.read<List>('isFavouritesList');

    if (storedShopping != null) {
      favouritesList =
          storedShopping.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();

      return searchTitle.contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
