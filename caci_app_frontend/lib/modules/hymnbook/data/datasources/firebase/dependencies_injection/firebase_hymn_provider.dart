import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase_hymn_remote_datasource.dart';
import '../firebase_hymn_remote_datasource_impl.dart';


final getIt = GetIt.instance;

void registerFirebaseHymnDependencies() {
  // Register FirebaseFirestore if not already
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register FirebaseHymnRemoteDatasource
  getIt.registerLazySingleton<FirebaseHymnRemoteDataSource>(
    () => FirebaseHymnRemoteDatasourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
}