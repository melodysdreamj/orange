library orange;

import 'package:orange/src/map.dart';

class Orange {
  static Future<void> setInt(String key, int value) async {
    await OrangeMap.set(key, value);
  }

  static Future<void> setString(String key, String value) async {
    await OrangeMap.set(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await OrangeMap.set(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    await OrangeMap.set(key, value);
  }

  static Future<int?> getInt(String key) async {
    return await OrangeMap.get(key) as int?;
  }

  static Future<String?> getString(String key) async {
    return await OrangeMap.get(key) as String?;
  }

  static Future<double?> getDouble(String key) async {
    return await OrangeMap.get(key) as double?;
  }

  static Future<bool?> getBool(String key) async {
    return await OrangeMap.get(key) as bool?;
  }

  static Future<void> remove(String key) async {
    await OrangeMap.remove(key);
  }

  static Future<bool> isSavedToDisk() async {
    return await OrangeMap.isSavedToDisk();
  }

  static Future<void> init() async {
    return await OrangeMap.init();
  }
}
