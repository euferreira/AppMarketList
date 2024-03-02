import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class ISecureStorage {
  Future<String?> read(String key);

  Future<void> write(String key, String value);
}

class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String key = 'hive_encryption_key';

  @override
  Future<String?> read(String key) async => await _storage.read(key: key);

  @override
  Future<void> write(String key, String value) async => await _storage.write(key: key, value: value);
}
