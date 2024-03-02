import 'package:get/get.dart';
import 'package:market_list/src/core/app.module.dart';
import 'package:market_list/src/modules/home/application/home.binding.dart';
import 'package:market_list/src/modules/home/application/home.page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: HomeRoute.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
          transition: Transition.fadeIn,
          title: 'Market List | Home',
        ),
      ];
}

class HomeRoute {
  static const home = '/home';
}
