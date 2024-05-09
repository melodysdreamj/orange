library orange;

import 'package:orange/src/map.dart';

class Orange {
  static void setInt(String key, int value) {
    OrangeMap.set(key, value);
  }

  static void setString(String key, String value) {
    OrangeMap.set(key, value);
  }

  static void setDouble(String key, double value) {
    OrangeMap.set(key, value);
  }

  static void setBool(String key, bool value) {
    OrangeMap.set(key, value);
  }

  static int? getInt(String key) {
    return OrangeMap.get(key) as int?;
  }

  static String? getString(String key) {
    return OrangeMap.get(key) as String?;
  }

  static double? getDouble(String key) {
    return OrangeMap.get(key) as double?;
  }

  static bool? getBool(String key) {
    return OrangeMap.get(key) as bool?;
  }

  static void remove(String key) async {
    OrangeMap.remove(key);
  }

  static Future<bool> isSavedToDisk() async {
    return await OrangeMap.isSavedToDisk();
  }

  static Future<void> init() async {
    return await OrangeMap.init();
  }
}
