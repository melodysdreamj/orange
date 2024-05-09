library orange;

import 'package:orange/src/map.dart';

class Orange {
  Future<void> setInt(String key, int value) async {
    await OrangeMap.set(key, value);
  }

  Future<void> setString(String key, String value) async {
    await OrangeMap.set(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await OrangeMap.set(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await OrangeMap.set(key, value);
  }

  Future<int?> getInt(String key) async {
    return await OrangeMap.get(key) as int?;
  }

  Future<String?> getString(String key) async {
    return await OrangeMap.get(key) as String?;
  }

  Future<double?> getDouble(String key) async {
    return await OrangeMap.get(key) as double?;
  }

  Future<bool?> getBool(String key) async {
    return await OrangeMap.get(key) as bool?;
  }

  Future<void> remove(String key) async {
    await OrangeMap.remove(key);
  }

  Future<bool> isSavedToDisk() async {
    return await OrangeMap.isSavedToDisk();
  }

  Future<void> init() async {
    return await OrangeMap.init();
  }
}
