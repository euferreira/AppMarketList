import 'package:get/get.dart';
import 'package:market_list/src/core/app.module.dart';

import 'application/products.binding.dart';
import 'application/products.page.dart';

class ProductsModule extends Module {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: ProductsRoute.products,
          page: () => const ProductsPage(),
          binding: ProductsBinding(),
          transition: Transition.fadeIn,
        ),
      ];
}

class ProductsRoute {
  static const String products = '/products';
}
