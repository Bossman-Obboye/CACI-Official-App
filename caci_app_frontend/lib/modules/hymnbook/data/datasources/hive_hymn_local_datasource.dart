import 'package:cac_official/modules/hymnbook/data/models/hive/hive_hymn_model.dart';
import 'package:hive/hive.dart';

/// A local data source for managing hymns using Hive.
class HiveHymnLocalDatasource {
  static const String _repositoryName = 'hymns_repository';

  /// Opens or retrieves the hymn repository (Hive box).
  Future<Box<HiveHymnModel>> _getHymnRepository() async {
    if (Hive.isBoxOpen(_repositoryName)) {
      return Hive.box<HiveHymnModel>(_repositoryName);
    } else {
      return await Hive.openBox<HiveHymnModel>(_repositoryName);
    }
  }

  /// Adds a new hymn to the repository.
  Future<void> addHymn(HiveHymnModel hymn) async {
    final repository = await _getHymnRepository();
    await repository.put(hymn.id, hymn);
  }

  /// Retrieves all hymns from the repository.
  Future<List<HiveHymnModel>> getAllHymns() async {
    final repository = await _getHymnRepository();
    return repository.values.toList();
  }

  /// Retrieves a hymn by its ID.
  Future<HiveHymnModel?> getHymnById(String id) async {
    final repository = await _getHymnRepository();
    return repository.get(id);
  }

  /// Retrieves a hymn by its number.
  Future<HiveHymnModel?> getHymnByNumber(int hymnNumber) async {
    final repository = await _getHymnRepository();
    try {
      return repository.values.firstWhere(
        (hymn) => hymn.hymnNumber == hymnNumber
      );
    } catch (_) {
      return null;
    }
  }

  /// Updates an existing hymn in the repository.
  Future<void> updateHymn(HiveHymnModel updatedHymn) async {
    final repository = await _getHymnRepository();
    await repository.put(updatedHymn.id, updatedHymn);
  }

  /// Deletes a hymn by its ID.
  Future<void> deleteHymn(String id) async {
    final repository = await _getHymnRepository();
    await repository.delete(id);
  }

  /// Deletes all hymns from the repository.
  Future<void> deleteAllHymn() async {
    final repository = await _getHymnRepository();
    await repository.clear();
  }

  /// Searches hymns based on a query string.
  Future<List<HiveHymnModel>> searchHymns(String query) async {
    final repository = await _getHymnRepository();
    final lowerCasedQuery = query.toLowerCase();

    return repository.values.where((hymn) {
      final inNumber = hymn.hymnNumber.toString().contains(lowerCasedQuery);
      final inTitle = hymn.title.toLowerCase().contains(lowerCasedQuery);
      final inAuthor = hymn.author?.toLowerCase().contains(lowerCasedQuery) ?? false;
      final inTags = hymn.tags.any(
        (tag) => tag.toLowerCase().contains(lowerCasedQuery),
          );
      final inStanzas = hymn.stanzas.any(
        (stanza) => stanza.lines.any(
          (line) => line.toLowerCase().contains(lowerCasedQuery),
        ),
          );
      final inChoruses = hymn.choruses.any(
        (chorus) => chorus.lines.any(
          (line) => line.toLowerCase().contains(lowerCasedQuery),
        ),
          );

      return inNumber || inTitle || inAuthor || inTags || inStanzas || inChoruses;
    }).toList();
  }
}
