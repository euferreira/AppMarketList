import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/shared/services/bottom_navbar.service.dart';

import '../navigation.module.dart';

class BottomNavbarController extends GetxController with GetSingleTickerProviderStateMixin, WidgetsBindingObserver {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void changeIndex(BuildContext context, int index) {
    if (index == NavigationIndex.menu) {
      scaffoldKey.currentState?.openDrawer();
      return;
    }

    BottomNavBar.navigate(index);
  }

  Future<bool> onWillPop(GetNavConfig? navConfig) async {
    String actualPage = navConfig?.uri.toString() ?? '';
    if (actualPage.contains("${NavigationRoute.name}/")) {
      BottomNavBar.to.back();
    }

    return false;
  }
}
