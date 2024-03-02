import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';
import 'package:market_list/src/modules/navigation/application/bottom_navbar.controller.dart';
import 'package:market_list/src/shared/services/bottom_navbar.service.dart';

class BottomNavbarBinding extends Binding {
  @override
  void dependencies() {
    exports();

    Get.lazyPut(() => BottomNavbarController(), fenix: true);
  }

  @override
  void exports() {
    Get.lazyPut(() => BottomNavBarService(), fenix: true);
  }
}
