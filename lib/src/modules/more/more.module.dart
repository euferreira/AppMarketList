import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/core/app.module.dart';

class MoreModule extends Module {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: MoreRoute.name,
          page: () => Scaffold(
            appBar: AppBar(
              title: const Text('More'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Go back!'),
              ),
            ),
          ),
          transition: Transition.cupertino,
        ),
      ];
}

class MoreRoute {
  static const name = '/more';
}
