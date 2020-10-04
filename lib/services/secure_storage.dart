import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Use it to store user's token & email.
class SecureStorageService {
  final storage = FlutterSecureStorage();

  Future set({@required String key, @required String value}) async {
    return await storage.write(key: key, value: value);
  }

  Future<String> get({@required String key, @required String value}) async {
    return await storage.read(key: key);
  }
}
