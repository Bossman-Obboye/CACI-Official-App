import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/hymn_model.dart';
import 'firebase_hymn_remote_datasource.dart';

class FirebaseHymnRemoteDatasourceImpl implements FirebaseHymnRemoteDataSource {
  final FirebaseFirestore firestore;

  FirebaseHymnRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<HymnModel>> fetchHymns(String languageCode) async {
    final snapshot = await firestore.collection(languageCode).get();
    return snapshot.docs.map((doc) => HymnModel.fromJson(doc.data())).toList();
  }

  @override
  Future<HymnModel?> fetchHymnById(String languageCode, String id) async {
    final doc = await firestore.collection(languageCode).doc(id).get();
    return doc.exists ? HymnModel.fromJson(doc.data()!) : null;
  }

  @override
  Future<void> addHymn(String languageCode, HymnModel hymn) async {
    await firestore.collection(languageCode).doc(hymn.id).set(hymn.toJson());
  }

  @override
  Future<void> updateHymn(String languageCode, HymnModel hymn) async {
    await firestore.collection(languageCode).doc(hymn.id).update(hymn.toJson());
  }

  @override
  Future<void> deleteHymn(String languageCode, String id) async {
    await firestore.collection(languageCode).doc(id).delete();
  }

  @override
  Future<void> uploadHymnList(String languageCode, List<HymnModel> hymns) async {
    final batch = firestore.batch();
    final collection = firestore.collection(languageCode);

    for (final hymn in hymns) {
      final docRef = collection.doc(hymn.id);
      batch.set(docRef, hymn.toJson());
    }

    await batch.commit();
  }
}
