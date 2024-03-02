import 'package:get/get.dart';
import 'package:market_list/src/core/app.module.dart';
import 'package:market_list/src/modules/categories/categories.module.dart';
import 'package:market_list/src/modules/home/home.module.dart';
import 'package:market_list/src/modules/more/more.module.dart';
import 'package:market_list/src/modules/products/products.module.dart';

import 'application/bottom_navbar.binding.dart';
import 'application/bottom_navbar.page.dart';

class NavigationModule extends Module {
  @override
  List<Module> get subModules => [
        HomeModule(),
        MoreModule(),
        CategoriesModule(),
        ProductsModule(),
      ];

  @override
  GetPage? routeBuilder(List<GetPage> pages) {
    return GetPage(
      preventDuplicates: true,
      name: NavigationRoute.name,
      binding: BottomNavbarBinding(),
      page: () => const BottomNavbarPage(),
      transition: Transition.fadeIn,
      children: pages,
    );
  }
}

class NavigationRoute {
  static const name = '/bottom-navbar';
}

class NavigationIndex {
  static const menu = 0;
  static const home = 1;
  static const more = 2;
}
