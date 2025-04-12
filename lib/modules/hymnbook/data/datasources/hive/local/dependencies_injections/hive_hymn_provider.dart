import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import '../../../../models/hive/hive_chorus_model.dart';
import '../../../../models/hive/hive_hymn_model.dart' show HiveHymnModelAdapter;
import '../../../../models/hive/hive_stanza_model.dart';
import '../../hive_hymn_local_datasource.dart';

class HiveServices {
  // Singleton pattern
  HiveServices._privateConstructor();
  static final HiveServices _instance = HiveServices._privateConstructor();
  factory HiveServices() => _instance;

  static final GetIt getIt = GetIt.instance;

  /// Initialize Hive with adapters
  static Future<void> initialize() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    Hive.registerAdapter(HiveStanzaModelAdapter());
    Hive.registerAdapter(HiveChorusModelAdapter());
    Hive.registerAdapter(HiveHymnModelAdapter());
  }

  /// Register dependencies in GetIt
  static void registerHiveHymnDependencies() {
    getIt.registerLazySingleton<HiveHymnLocalDatasource>(
      () => HiveHymnLocalDatasource(),
    );
  }
}