import 'package:cac_official/modules/hymnbook/data/models/hive/hive_hymn_model.dart';
import 'package:hive/hive.dart';

class HiveBoxManager {
   /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  HiveBoxManager._privateConstructor();
  // 2. Single static instance created once
  static final _instance = HiveBoxManager._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory HiveBoxManager() => _instance;

  static final Map<String, Box> _openBoxes = {};

  static Future<Box> openBoxIfNeeded(String boxName) async {
    if (isBoxOpen(boxName)) {
      return _openBoxes[boxName]!;
    }

    // If the box is not already open, open it and store it in the map.
    final box = await Hive.openBox<HiveHymnModel>(boxName);
    _openBoxes[boxName] = box;
    return box;
  }

  static Box<T> getBox<T>(String boxName) {
    return _openBoxes[boxName] as Box<T>;
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
