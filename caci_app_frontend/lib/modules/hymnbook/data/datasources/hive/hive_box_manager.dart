import 'package:hive/hive.dart';

class HiveBoxManager {
  static final Map<String, Box> _openBoxes = {};

  static Future<Box> openBoxIfNeeded(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      return _openBoxes[boxName]!;
    }

    // If the box is not already open, open it and store it in the map.
    final box = await Hive.openBox(boxName);
    _openBoxes[boxName] = box;
    return box;
  }

  static Box? getBox(String boxName) {
    return _openBoxes[boxName];
  }

  static bool isBoxOpen(String boxName) {
    return _openBoxes.containsKey(boxName);
  }


  static Future<void> closeBox(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      await _openBoxes[boxName]!.close();
      _openBoxes.remove(boxName);
    }
  }

  static Future<void> closeAllBoxes() async {
    for (var box in _openBoxes.values) {
      await box.close();
    }
    _openBoxes.clear();
  }
  static Future<void> deleteBox(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      await _openBoxes[boxName]!.deleteFromDisk();
      _openBoxes.remove(boxName);
    }
  }
  static Future<void> deleteAllBoxes() async {
    for (var box in _openBoxes.values) {
      await box.deleteFromDisk();
    }
    _openBoxes.clear();
  }
  static Future<void> clearBox(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      await _openBoxes[boxName]!.clear();
    }
  }

  static Future<void> clearAllBoxes() async {
    for (var box in _openBoxes.values) {
      await box.clear();
    }
  }

}
