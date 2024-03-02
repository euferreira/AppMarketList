import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:market_list/src/core/app.widget.dart';

import 'src/shared/hive/hive.config.dart';
import 'src/shared/hive/secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await HiveConfig(secureStorage: SecureStorage()).init();
  runApp(const MarketList());
}
