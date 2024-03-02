import 'package:get/get.dart';
import 'package:market_list/src/core/app.module.dart';

import 'application/categories.binding.dart';
import 'application/categories.page.dart';

class CategoriesModule extends Module {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: CategoriesRoute.categories,
          page: () => const CategoriesPage(),
          binding: CategoriesBinding(),
          transition: Transition.fadeIn,
          title: "Categories",
        ),
      ];
}

class CategoriesRoute {
  static const String categories = '/categories';
}
