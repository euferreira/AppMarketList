import 'dart:async';

import 'package:get/get.dart';
import 'package:market_list/src/modules/home/home.module.dart';
import 'package:market_list/src/modules/more/more.module.dart';
import 'package:market_list/src/modules/navigation/navigation.module.dart';

class BottomNavBar {
  BottomNavBar._();
  static BottomNavBarService get to => Get.find<BottomNavBarService>();
  static GetDelegate get delegate => to.delegate;
  static int get index => to.currentIndex.value;
  static void navigate(int index) => to.navigateByIndex(index);
  static String get currentRoute => to.delegate.currentConfiguration?.currentPage?.name ?? '';
  static Future<T> changePage<T>(String route) => to.changePage<T>(route);
  static Future<bool> back({Object? result}) => to.back(result: result);
  static void showMenu(bool value) => to.showMenu(value);

  static Map<String, String?> get parameters {
    if (Get.parameters.length > 2) {
      return Get.parameters;
    }

    if (to.delegate.history.isEmpty && Get.testMode == false) {
      return to.parameters;
    }

    return to.delegate.parameters;
  }
}

class BottomNavBarService extends GetxService {
  final GetDelegate delegate = GetDelegate();

  Map<String, String> parameters = {};
  RxInt currentIndex = 1.obs;
  String menuSelecionado = "";
  RxBool showMenu = true.obs;
  bool overBottomNavbar = false;
  String currentPage = NavigationRoute.name + HomeRoute.home;

  final _allCompleters = <String, Completer>{};

  @override
  void onInit() {
    delegate.addListener(() {
      _saveLastRoute();
      final page = delegate.currentConfiguration?.currentPage?.name ?? '';
      currentPage = page;

      updateIndex(page.replaceFirst(NavigationRoute.name, ""));
    });

    super.onInit();
  }

  Future<T> changePage<T>(
    String route, {
    Map<String, String>? parameters,
    dynamic arguments,
    bool showMenu = true,
    bool newStack = false,
  }) {
    final completer = Completer<T>();
    final currentRoute = delegate.currentConfiguration?.currentPage?.name ?? '';

    _allCompleters[currentRoute] = completer;

    if (!newStack) {
      toggleMenu(showMenu: showMenu);
      if (overBottomNavbar) Get.back();
      overBottomNavbar = false;

      delegate.toNamed(
        NavigationRoute.name + route,
        parameters: parameters,
        arguments: arguments,
      );

      return completer.future;
    }

    setParameters(parameters);
    setArguments(arguments);

    overBottomNavbar = true;

    Get.toNamed(
      NavigationRoute.name + route,
      parameters: parameters,
      arguments: arguments,
    );

    return completer.future;
  }

  Future<bool> back({Object? result, bool showMenu = true}) async {
    //final currentPage = delegate.currentConfiguration?.currentPage?.name ?? "";
    final lengthTreeBranch = delegate.currentConfiguration?.currentTreeBranch.length;
    toggleMenu(showMenu: showMenu);

    if (overBottomNavbar) {
      overBottomNavbar = false;
      Get.back(result: result);
      return true;
    }

    if (lengthTreeBranch != null && lengthTreeBranch > 3) {
      await delegate.popRoute(result: result);
    } else {
      changePage(menuSelecionado);
    }

    final route = delegate.currentConfiguration?.currentPage?.name;
    if (_allCompleters.containsKey(route)) {
      _allCompleters[route]?.complete(result);
      _allCompleters.remove(route);
    }

    return true;
  }

  void setParameters(Map<String, String>? parameters) {
    this.parameters.clear();
    delegate.parameters.clear();
    if (parameters != null) {
      this.parameters.addAll(parameters);
      delegate.parameters.addAll(parameters);
    }
  }

  void setArguments(dynamic arguments) {}

  void navigateByIndex(int index) {
    switch (index) {
      case NavigationIndex.home:
        menuSelecionado = HomeRoute.home;
        changePage(HomeRoute.home);
        break;
      case NavigationIndex.more:
        menuSelecionado = MoreRoute.name;
        changePage(MoreRoute.name);
        break;
    }
  }

  void updateIndex(String route) => currentIndex.value = _getIndex(route.replaceFirst(NavigationRoute.name, ""));

  void toggleMenu({bool? showMenu}) {
    if (showMenu != null) {
      this.showMenu.value = showMenu;
      return;
    }
    this.showMenu.toggle();
  }

  int _getIndex(String route) => switch (route) {
        HomeRoute.home => NavigationIndex.home,
        MoreRoute.name => NavigationIndex.more,
        _ => NavigationIndex.home,
      };

  void _saveLastRoute([String? currentPage]) {
    String page = currentPage ?? this.currentPage;
    if (!Get.isRegistered<String?>(tag: 'lastPage')) {
      Get.put<String?>(page, tag: 'lastPage', permanent: true);
    }
    Get.replace<String?>(page, tag: 'lastPage');
  }
}
