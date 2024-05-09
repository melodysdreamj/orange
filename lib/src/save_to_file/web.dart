import 'dart:async';
import 'dart:convert';

import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

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
    return await _store.record(key).get(_db);
  }

  Future<void> remove(String key) async {
    await _ready();
    isRunning = true;
    _removeController.add(key);
  }

  Future<Map<String, dynamic>> getMap() async {
    await _ready();
    final records = await _store.find(_db);
    Map<String, dynamic> map = {};
    records.forEach((record) {
      map[record.key.toString()] = (jsonDecode(record.value! as String)['v']);
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
  static late StoreRef _store;
  static late Database _db;
  static Timer? _actionTimer;
  static bool isRunning = false;
  static Completer<bool>? _diskSaveCompleter;

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
    _store = stringMapStoreFactory.store();
    _db = await databaseFactoryWeb.openDatabase('orange');

    EasyEventBus.on('orange_device_storage_saved_to_disk', (event) {
      _diskSaveCompleter?.complete(true);
      _diskSaveCompleter = null;
    });

    _setController.stream.listen((data) async {
      await _store.record(data['k']).put(_db, jsonEncode({'v': data['v']}));
      _resetTimer();
    });
    _removeController.stream.listen((key) async {
      await _store.record(key).delete(_db);
      _resetTimer();
    });
  }
}
