import 'dart:async';

// import 'save_to_file/device.dart';
import 'save_to_file/device.dart'
    if (dart.library.html) 'save_to_file/web.dart'
    if (dart.library.js) 'save_to_file/web.dart'
    if (dart.library.cli) 'save_to_file/cli.dart';

class OrangeMap {
  static Map<String, dynamic>? _map;

  static void set(String key, dynamic value) {
    if (_map == null) throw Exception('OrangeMap not initialized');
    _map![key] = value;
    DeviceStorage().set(key, value);
  }

  static dynamic get(String key) {
    if (_map == null) throw Exception('OrangeMap not initialized');
    return _map![key];
  }

  static void remove(String key) {
    if (_map == null) throw Exception('OrangeMap not initialized');
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
