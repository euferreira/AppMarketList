import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/categories/categories.module.dart';
import 'package:market_list/src/modules/navigation/application/bottom_navbar.controller.dart';
import 'package:market_list/src/modules/products/products.module.dart';
import 'package:market_list/src/shared/constants.dart';
import 'package:market_list/src/shared/services/bottom_navbar.service.dart';

import '../navigation.module.dart';
import 'widgets/navbar.widget.dart';
import 'widgets/navigation-with-offstage.widget.dart';

class BottomNavbarPage extends GetView<BottomNavbarController> {
  const BottomNavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? debounceClick;

    return GetRouterOutlet.builder(
      routerDelegate: BottomNavBar.delegate,
      builder: (_, delegate, navConfig) => PopScope(
        canPop: false,
        onPopInvoked: (_) => controller.onWillPop(navConfig),
        child: Scaffold(
          key: controller.scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  key: const Key('drawer-header'),
                  decoration: const BoxDecoration(
                    color: ColorsPallet.blue500,
                  ),
                  child: Center(
                    child: Text(
                      'Market List',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: ColorsPallet.light0,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  key: const Key('drawer-categories'),
                  title: const Text('Categorias'),
                  leading: const Icon(Icons.category),
                  onTap: () {
                    BottomNavBar.changePage(CategoriesRoute.categories);
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
                ListTile(
                  key: const Key('drawer-products'),
                  title: const Text('Produtos'),
                  leading: const Icon(Icons.shopping_cart),
                  onTap: () {
                    BottomNavBar.changePage(ProductsRoute.products);
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ],
            ),
          ),
          body: Obx(
            () => NavigationWithOffStageWidget(
              bodyNavigation: GetRouterOutlet(
                initialRoute: '${NavigationRoute.name}/home',
                anchorRoute: NavigationRoute.name,
                delegate: delegate,
              ),
              enableMarginBottom: false,
              enableOffStage: false,
              minOffStageWidget: const SizedBox(),
              enableMinOffStage: false,
              maxOffStageWidget: const SizedBox(),
              enableMaxOffStage: BottomNavBar.to.showMenu.isTrue,
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => BottomNavBar.to.showMenu.isTrue
                    ? Navbar(
                        onTap: (index) {
                          if (debounceClick?.isActive ?? false) {
                            debounceClick?.cancel();
                          }

                          debounceClick = Timer(
                            const Duration(milliseconds: 200),
                            () => controller.changeIndex(context, index),
                          );
                        },
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
