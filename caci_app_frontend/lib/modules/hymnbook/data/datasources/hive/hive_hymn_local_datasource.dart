import 'package:cac_official/modules/hymnbook/data/datasources/hive/local/hive_box_initializer.dart';
import 'package:cac_official/modules/hymnbook/data/datasources/hive/local/hive_box_manager.dart';
import 'package:cac_official/modules/hymnbook/data/models/hive/hive_hymn_model.dart';
import 'package:hive/hive.dart';

/// A local data source for managing hymns using Hive with singleton pattern.
class HiveHymnLocalDatasource {

  /// Private constructor for singleton pattern.
  /// This constructor is private to prevent instantiation from outside the class.
  /// It initializes the Hive box if it is not already open.
  ///
  /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  HiveHymnLocalDatasource._privateConstructor();
  // 2. Single static instance created once
  static final _instance = HiveHymnLocalDatasource._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory HiveHymnLocalDatasource() => _instance;

  /// Private method to get the hymn box.
  /// This method initializes the Hive box if it is not already open.
  Future<Box<HiveHymnModel>> _getHymnBox(String boxName) async {
    await HiveBoxInitializer.initializeHiveBox(boxName);
    return HiveBoxManager.getBox<HiveHymnModel>(boxName);
  }

  /// Adds a new hymn to the box.
  Future<void> addHymn(HiveHymnModel hymn, String boxName) async {
    final box = await _getHymnBox(boxName);
    await box.put(hymn.id, hymn);
  }

  /// Adds multiple hymns to the box.
  Future<void> addAll(List<HiveHymnModel> hymns, String boxName) async {
    final box = await _getHymnBox(boxName);
    final Map<String, HiveHymnModel> map = {
      for (final hymn in hymns) hymn.id: hymn,
    };
    await box.putAll(map);
  }

  /// Returns all hymns from the box.
  Future<List<HiveHymnModel>> getAllHymns(String boxName) async {
    final box = await _getHymnBox(boxName);
    return box.values.toList();
  }

  /// Returns the number of hymns in the box.
  Future<int> getHymnCount(String boxName) async {
    final box = await _getHymnBox(boxName);
    return box.length;
  }

  /// Checks if a hymn exists by its ID.
  Future<bool> exists(String boxName, String id) async {
    final box = await _getHymnBox(boxName);
    return box.containsKey(id);
  }

  /// Retrieves a hymn by its ID.
  Future<HiveHymnModel?> getHymnById(String boxName, String id) async {
    final box = await _getHymnBox(boxName);
    return box.get(id);
  }

  /// Retrieves a hymn by its number.
  Future<HiveHymnModel?> getHymnByNumber(String boxName, int hymnNumber) async {
    final box = await _getHymnBox(boxName);
    try {
      return box.values.firstWhere((hymn) => hymn.hymnNumber == hymnNumber);
    } catch (_) {
      return null;
    }
  }

  /// Updates a hymn by overwriting it with the same ID.
  Future<void> updateHymn(HiveHymnModel updatedHymn, String boxName) async {
    final box = await _getHymnBox(boxName);
    await box.put(updatedHymn.id, updatedHymn);
  }

  /// Deletes a hymn by its ID.
  Future<void> deleteHymn(String boxName, String id) async {
    final box = await _getHymnBox(boxName);
    await box.delete(id);
  }

  /// Clears all hymns from the box.
  Future<void> deleteAllHymns(String boxName) async {
    final box = await _getHymnBox(boxName);
    await box.clear();
  }

  /// Searches hymns using query matching multiple fields.
  Future<List<HiveHymnModel>> searchHymns(String boxName, String query) async {
    final box = await _getHymnBox(boxName);
    final lowerQuery = query.toLowerCase();

    return box.values.where((hymn) {
      return hymn.hymnNumber.toString().contains(lowerQuery) ||
          hymn.title.toLowerCase().contains(lowerQuery) ||
          (hymn.author?.toLowerCase().contains(lowerQuery) ?? false) ||
          hymn.tags.any((tag) => tag.toLowerCase().contains(lowerQuery)) ||
          hymn.stanzas.any(
            (s) => s.lines.any((l) => l.toLowerCase().contains(lowerQuery)),
          ) ||
          hymn.choruses.any(
            (c) => c.lines.any((l) => l.toLowerCase().contains(lowerQuery)),
          );
    }).toList();
  }

  /// Filter hymns by a specific author.
  Future<List<HiveHymnModel>> getHymnsByAuthor(
    String boxName,
    String author,
  ) async {
    final box = await _getHymnBox(boxName);
    return box.values
        .where((hymn) => hymn.author?.toLowerCase() == author.toLowerCase())
        .toList();
  }

  /// Filter hymns by a specific tag.
  Future<List<HiveHymnModel>> getHymnsByTag(String boxName, String tag) async {
    final box = await _getHymnBox(boxName);
    return box.values
        .where(
          (hymn) => hymn.tags.any((t) => t.toLowerCase() == tag.toLowerCase()),
        )
        .toList();
  }
}
