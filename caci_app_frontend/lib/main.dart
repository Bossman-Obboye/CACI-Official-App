import 'package:cac_official/modules/hymnbook/data/models/hive/hive_chorus_model.dart';
import 'package:cac_official/modules/hymnbook/data/models/hive/hive_hymn_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'modules/hymnbook/data/models/hive/hive_stanza_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appOfflineRepository = await getApplicationDocumentsDirectory();
  Hive.init(appOfflineRepository.path);

  Hive.registerAdapter(HiveStanzaModelAdapter());
  Hive.registerAdapter(HiveChorusModelAdapter());
  Hive.registerAdapter(HiveHymnModelAdapter());

  runApp(const CACApp());
}

class CACApp extends StatelessWidget {
  const CACApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HymnHome());
  }
}

class HymnHome extends StatelessWidget {
  const HymnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
