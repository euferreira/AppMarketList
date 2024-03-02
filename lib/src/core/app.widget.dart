import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';
import 'package:market_list/src/core/app.module.dart';
import 'package:market_list/src/modules/navigation/navigation.module.dart';

class MarketList extends GetView {
  const MarketList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Market List',
      getPages: AppModule().collectRoutes(),
      initialBinding: AppBinding(),
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: kDebugMode,
      initialRoute: NavigationRoute.name,
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
