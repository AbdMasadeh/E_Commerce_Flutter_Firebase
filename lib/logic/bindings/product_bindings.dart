import 'package:get/instance_manager.dart';

import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    // Get.lazyPut(() => CartController());
    // Get.put(CategoryController());
  }
}
