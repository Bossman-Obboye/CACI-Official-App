import '../local/favorite_hymn_repository_impl.dart';
import '../remote/hymn_firebase_repository_impl.dart';
import '../local/hymn_local_repository_impl.dart';

class HymnAbstractRepoImpl {
  final HymnLocalRepositoryImpl local;
  final HymnFirebaseRepositoryImpl firebase;
  final FavoriteHymnRepositoryImpl favorite;

  HymnAbstractRepoImpl({
    required this.local,
    required this.firebase,
    required this.favorite,
  });

  
}
