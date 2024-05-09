import 'dart:async';

// import 'save_to_file/device.dart';
import 'save_to_file/device.dart'
    if (dart.library.html) 'save_to_file/web.dart'
    if (dart.library.cli) 'save_to_file/cli.dart';

class OrangeMap {
  static Map<String, dynamic>? _map;

  static Future<void> set(String key, dynamic value) async {
    _map ??= await DeviceStorage().getMap();
    _map![key] = value;
    DeviceStorage().set(key, value);
  }

  static Future<dynamic> get(String key) async {
    _map ??= await DeviceStorage().getMap();
    return _map![key];
  }

  static Future<void> remove(String key) async {
    _map ??= await DeviceStorage().getMap();
    _map!.remove(key);
    DeviceStorage().remove(key);
  }

  static Future<bool> isSavedToDisk() async {
    return await DeviceStorage().isSavedToDisk();
  }

  static Future<void> init() async {
    _map ??= await DeviceStorage().getMap();
  }
}
