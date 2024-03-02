import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';

class ProductsBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
