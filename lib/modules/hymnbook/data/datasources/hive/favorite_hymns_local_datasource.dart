import 'package:hive/hive.dart';

import '../../../../../core/constants/database/hive_box_names.dart';
import 'local/hive_box_initializer.dart';
import 'local/hive_box_manager.dart';

class FavoriteLocalDatasource {
  /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  FavoriteLocalDatasource._privateConstructor();
  // 2. Single static instance created once
  static final _instance = FavoriteLocalDatasource._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory FavoriteLocalDatasource() => _instance;

  Future<Box> _getFavoritesBox() async {
    await HiveBoxInitializer.initializeHiveBox(HiveBoxNames.favoriteHymns);
    return HiveBoxManager.getBox(HiveBoxNames.favoriteHymns);
  }

  Future<void> addFavorite(String hymnId, String hymnBoxName) async {
    final box = await _getFavoritesBox();
    await box.put(hymnId, hymnBoxName);
  }

  Future<void> removeFavorite(String hymnId) async {
    final box = await _getFavoritesBox();
    await box.delete(hymnId);
  }

  Future<bool> isFavorite(String hymnId) async {
    final box = await _getFavoritesBox();
    return box.containsKey(hymnId);
  }

  Future<List<MapEntry<String, String>>> getFavoriteRefs() async {
    final box = await _getFavoritesBox();
    return box
        .toMap()
        .entries
        .map((e) => MapEntry(e.key as String, e.value as String))
        .toList();
  }

  Future<void> clearFavorites() async {
    final box = await _getFavoritesBox();
    await box.clear();
  }
}
