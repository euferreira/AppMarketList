import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:market_list/src/shared/hive/adapters/categories.hive.dart';
import 'package:market_list/src/shared/hive/adapters/products.hive.dart';
import 'package:market_list/src/shared/hive/constants/hive.consts.dart';
import 'package:market_list/src/shared/hive/secure_storage.dart';

abstract interface class IHiveConfig {
  Future<void> init();

  Future<void> collections();

  Future<void> adapters();
}

class HiveConfig implements IHiveConfig {
  final ISecureStorage _secureStorage;

  HiveConfig({required ISecureStorage secureStorage}) : _secureStorage = secureStorage;

  @override
  Future<void> adapters() async {
    Hive.registerAdapter(CategoriesHiveAdapter());
    Hive.registerAdapter(ProductsHiveAdapter());
  }

  @override
  Future<void> collections() async {
    HiveAesCipher? cipher;
    String? key;

    try {
      key = await _secureStorage.read(SecureStorage.key);
      if (key == null) {
        await _generateKey();
        key = await _secureStorage.read(SecureStorage.key);
      }
      cipher = HiveAesCipher(base64Url.decode(key ?? 'secureKey'));
    } catch (e) {
      await _generateKey();
      key = await _secureStorage.read(SecureStorage.key);
      cipher = HiveAesCipher(base64Url.decode(key ?? 'secureKey'));
    }

    await Hive.openBox<String>(HiveName.theme, encryptionCipher: cipher);

    await Hive.openBox<CategoriesHive>(HiveName.categories, encryptionCipher: cipher);
    await Hive.openBox<ProductsHive>(HiveName.products, encryptionCipher: cipher);
  }

  Future<void> _generateKey() async {
    final key = Hive.generateSecureKey();
    await _secureStorage.write(SecureStorage.key, base64UrlEncode(key));
  }

  @override
  Future<void> init() async {
    await adapters();
    await collections();
  }
}
