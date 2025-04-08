import 'package:cac_official/modules/hymnbook/domain/entities/hymn_entity.dart';

/// Abstract repository interface for managing hymns.
/// This defines the contract for any implementation of hymn-related data operations.
abstract class HymnAbstractRepository {
  // ───── Fetching ─────

  /// Fetches all hymns, optionally filtered by language.
  /// 
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> fetchAllHymns({String? language});

  /// Fetches a hymn by its number, optionally filtered by language.
  /// 
  /// [hymnNumber] - The number of the hymn to fetch.
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a single [HymnEntity].
  Future<HymnEntity> fetchHymnByNumber(int hymnNumber, {String? language});

  /// Fetches hymns by a specific category, optionally filtered by language.
  /// 
  /// [category] - The category to filter hymns by.
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> fetchHymnsByCategory(
    String category, {
    String? language,
  });

  /// Fetches a hymn by its unique ID, optionally filtered by language.
  /// 
  /// [id] - The unique identifier of the hymn.
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a single [HymnEntity].
  Future<HymnEntity> fetchHymnById(String id, {String? language});

  /// Fetches hymns by a specific tag, optionally filtered by language.
  /// 
  /// [tag] - The tag to filter hymns by.
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> fetchHymnsByTag(String tag, {String? language});

  /// Searches hymns based on a query string, optionally filtered by language.
  /// 
  /// [query] - The search query string.
  /// [language] - Optional parameter to filter hymns by a specific language.
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> searchHymns(String query, {String? language});

  // ───── Favorites ─────

  /// Adds a hymn to the user's favorites.
  /// 
  /// [hymn] - The hymn to add as a favorite.
  Future<void> addFavoriteHymn(HymnEntity hymn);

  /// Removes a hymn from the user's favorites.
  /// 
  /// [hymnId] - The unique identifier of the hymn to remove.
  Future<void> removeFavoriteHymn(String hymnId);

  /// Fetches all hymns marked as favorites by the user.
  /// 
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> fetchFavoriteHymns();

  /// Checks if a hymn is marked as a favorite.
  /// 
  /// [hymnId] - The unique identifier of the hymn to check.
  /// Returns `true` if the hymn is a favorite, otherwise `false`.
  Future<bool> isHymnFavorite(String hymnId);

  // ───── Language/Metadata ─────

  /// Fetches a list of all available languages for hymns.
  /// 
  /// Returns a list of language strings.
  Future<List<String>> fetchAvailableLanguages();

  /// Fetches a list of all available categories for hymns.
  /// 
  /// Returns a list of category strings.
  Future<List<String>> fetchAvailableCategories();

  /// Fetches a list of all tags associated with hymns.
  /// 
  /// Returns a list of tag strings.
  Future<List<String>> fetchAllTags();

  // ───── Offline Support ─────

  /// Caches a list of hymns locally for offline access.
  /// 
  /// [hymns] - The list of hymns to cache.
  /// [language] - Optional parameter to specify the language of the hymns.
  Future<void> cacheHymnsLocally(List<HymnEntity> hymns, {String? language});

  /// Fetches cached hymns for offline access, optionally filtered by language.
  /// 
  /// [language] - Optional parameter to filter cached hymns by a specific language.
  /// Returns a list of [HymnEntity].
  Future<List<HymnEntity>> fetchCachedHymns({String? language});

  /// Checks if there is cached hymn data available, optionally filtered by language.
  /// 
  /// [language] - Optional parameter to check cached data for a specific language.
  /// Returns `true` if cached data exists, otherwise `false`.
  Future<bool> hasCachedHymns({String? language});



  // ───── Upload (optional) ─────

  /// Uploads a new hymn to the repository. This is typically for admin/editor access.
  /// 
  /// [hymn] - The hymn to upload.
  Future<void> uploadNewHymn(HymnEntity hymn);

  /// Deletes a hymn from the repository. This is typically for admin/editor access.
  /// 
  /// [hymnId] - The unique identifier of the hymn to delete.
  Future<void> deleteHymnById(String hymnId);
}
