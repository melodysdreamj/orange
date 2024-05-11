import 'dart:async';
import 'dart:convert';

import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DeviceStorage {
  static StreamController<dynamic> _setController = StreamController<dynamic>();
  static StreamController<String> _removeController =
      StreamController<String>();

  Future<void> set(String key, dynamic value) async {
    await _ready();
    isRunning = true;
    _setController.add({'k': key, 'v': value});
  }

  Future<dynamic> get(String key) async {
    await _ready();
    return box.get(key);
  }

  Future<void> remove(String key) async {
    await _ready();
    isRunning = true;
    _removeController.add(key);
  }

  Future<Map<String, dynamic>> getMap() async {
    await _ready();
    Map<String, dynamic> records = await box.getRealAll();
    Map<String, dynamic> map = {};

    records.forEach((key, value) {
      map[key] = jsonDecode(value)['v'];
    });


    return map;
  }

  Future<bool> isSavedToDisk() async {
    if (!isRunning) {
      return true;
    }

    if (_diskSaveCompleter == null) {
      _diskSaveCompleter = Completer<bool>();
    }
    return _diskSaveCompleter!.future;
  }

  ////////////////////////
  static bool _isOpened = false;
  static Timer? _actionTimer;
  static bool isRunning = false;
  static Completer<bool>? _diskSaveCompleter;
  static late Box box;


  void _resetTimer() {
    _actionTimer?.cancel();
    _actionTimer = Timer(Duration(milliseconds: 100), () {
      isRunning = false;
      EasyEventBus.fire('orange_device_storage_saved_to_disk', true);
    });
  }

  _ready() async {
    if (_isOpened) return;
    _isOpened = true;
    await _open();
  }

  _open() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    box = Hive.box();

    EasyEventBus.on('orange_device_storage_saved_to_disk', (event) {
      _diskSaveCompleter?.complete(true);
      _diskSaveCompleter = null;
    });

    _setController.stream.listen((data) async {
      box.put(data['k'], jsonEncode({'v': data['v']}));
      // await _store.record(data['k']).put(_db, jsonEncode({'v': data['v']}));
      _resetTimer();
    });
    _removeController.stream.listen((key) async {
      box.delete(key);
      _resetTimer();
    });
  }
}
