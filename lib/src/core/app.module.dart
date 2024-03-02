import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/navigation/navigation.module.dart';

abstract class Module {
  @protected
  List<Module> get subModules => [];

  @protected
  List<GetPage> get routes => [];

  @protected
  GetPage? routeBuilder(List<GetPage> pages) => null;

  @nonVirtual
  List<GetPage> collectRoutes() {
    final subModulesRoutes = subModules.expand((module) => module.collectRoutes()).toList();
    final route = routeBuilder(subModulesRoutes);

    return [
      ...routes,
      if (route != null) route else ...subModulesRoutes,
    ];
  }
}

class AppModule extends Module {
  @override
  List<Module> get subModules => [
        NavigationModule(),
      ];
}
