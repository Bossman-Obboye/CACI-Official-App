import '../../models/hymn_model.dart';

abstract class FirebaseHymnRemoteDataSource {
  Future<List<HymnModel>> fetchHymns(String languageCode);
  Future<HymnModel?> fetchHymnById(String languageCode, String id); // Read One
  Future<void> addHymn(String languageCode, HymnModel hymn); // Create
  Future<void> updateHymn(String languageCode, HymnModel hymn); // Update
  Future<void> deleteHymn(String languageCode, String id); // Delete
  Future<void> uploadHymnList(String languageCode, List<HymnModel> hymns);
}
