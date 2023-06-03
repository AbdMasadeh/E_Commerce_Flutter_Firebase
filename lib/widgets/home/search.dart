import 'package:final_project/logic/controller/product_controller.dart';
import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      icon: const Icon(Icons.search_outlined),
      hint: "Search for any Product...",
      hideText: false,
      action: TextInputAction.done,
      valid: () {},
      sufIcon: productController.searchTextController.text.isNotEmpty
          ? IconButton(
              onPressed: () {
                productController.clearSearch();
              },
              icon: const Icon(Icons.close))
          : IconButton(
              onPressed: () {},
              icon: const Icon(null),
            ),
      controller: productController.searchTextController,
    );
  }
}
