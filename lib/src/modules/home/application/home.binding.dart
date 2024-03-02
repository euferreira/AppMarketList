import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';

import 'home.controller.dart';

class HomeBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
