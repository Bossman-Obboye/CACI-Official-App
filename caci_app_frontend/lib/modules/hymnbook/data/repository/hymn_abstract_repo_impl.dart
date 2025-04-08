// import '../../domain/entities/hymn_entity.dart';
// import '../datasources/hive_hymn_local_datasource.dart';

// s/hymnbook/data/models/hymn_model.dart';

// class HymnAbstractRepoImpl implements HymnAbstractRepository {
//   final HymnRemoteDatasource remote;
//   // final HiveHymnLocalDatasource local;

//   HymnAbstractRepoImpl({
//     required this.remote,
//     required this.local,
//   });

//   // ───── Fetching ─────
//   @override
//   Future<List<HymnEntity>> fetchAllHymns({String? language}) async {
//     final models = await remote.fetchAllHymns(language);
//     return models;
//   }

//   @override
//   Future<HymnEntity> fetchHymnByNumber(int hymnNumber, {String? language}) async {
//     return await remote.fetchHymnByNumber(hymnNumber, language: language);
//   }

//   @override
//   Future<List<HymnEntity>> fetchHymnsByCategory(String category, {String? language}) async {
//     return await remote.fetchHymnsByCategory(category, language: language);
//   }

//   @override
//   Future<HymnEntity> fetchHymnById(String id, {String? language}) async {
//     return await remote.fetchHymnById(id, language: language);
//   }

//   @override
//   Future<List<HymnEntity>> fetchHymnsByTag(String tag, {String? language}) async {
//     return await remote.fetchHymnsByTag(tag, language: language);
//   }

//   @override
//   Future<List<HymnEntity>> searchHymns(String query, {String? language}) async {
//     return await remote.searchHymns(query, language: language);
//   }

//   // ───── Favorites ─────
//   @override
//   Future<void> addFavoriteHymn(HymnEntity hymn) async {
//     return await local.saveFavorite(hymn);
//   }

//   @override
//   Future<void> removeFavoriteHymn(String hymnId) async {
//     return await local.removeFavorite(hymnId);
//   }

//   @override
//   Future<List<HymnEntity>> fetchFavoriteHymns() async {
//     return await local.getFavoriteHymns();
//   }

//   @override
//   Future<bool> isHymnFavorite(String hymnId) async {
//     return await local.isFavorite(hymnId);
//   }

//   // ───── Language/Metadata ─────
//   @override
//   Future<List<String>> fetchAvailableLanguages() async {
//     return await remote.fetchAvailableLanguages();
//   }

//   @override
//   Future<List<String>> fetchAvailableCategories() async {
//     return await remote.fetchAvailableCategories();
//   }

//   @override
//   Future<List<String>> fetchAllTags() async {
//     return await remote.fetchAllTags();
//   }

//   // ───── Offline Support ─────
//   @override
//   Future<void> cacheHymnsLocally(List<HymnEntity> hymns, {String? language}) async {
//     await local.cacheHymns(hymns, language: language);
//   }

//   @override
//   Future<List<HymnEntity>> fetchCachedHymns({String? language}) async {
//     return await local.getCachedHymns(language: language);
//   }

//   @override
//   Future<bool> hasCachedHymns({String? language}) async {
//     return await local.hasCachedData(language: language);
//   }

//   // ───── Upload / Delete ─────
//   @override
//   Future<void> uploadNewHymn(HymnEntity hymn) async {
//     return await remote.uploadNewHymn(hymn);
//   }

//   @override
//   Future<void> deleteHymnById(String hymnId) async {
//     return await remote.deleteHymnById(hymnId);
//   }
// }
