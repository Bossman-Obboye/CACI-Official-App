import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

import '../../../../models/hive/hive_chorus_model.dart';
import '../../../../models/hive/hive_hymn_model.dart' show HiveHymnModelAdapter;
import '../../../../models/hive/hive_stanza_model.dart';

class HiveServices{
   /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  HiveServices._privateConstructor();
  // 2. Single static instance created once
  static final _instance = HiveServices._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory HiveServices() => _instance;


  static Future<void> initialize() async {
    final appOfflineRepository = await getApplicationDocumentsDirectory();
    Hive.init(appOfflineRepository.path);

    // Register Hive adapters for your models here
    Hive.registerAdapter(HiveStanzaModelAdapter());
    Hive.registerAdapter(HiveChorusModelAdapter());
    Hive.registerAdapter(HiveHymnModelAdapter());
  }

}