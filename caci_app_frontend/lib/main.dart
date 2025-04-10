import 'package:flutter/material.dart';
import 'modules/hymnbook/data/datasources/hive/local/dependencies_injections/hive_hymn_provider.dart';
import 'modules/hymnbook/data/datasources/firebase/dependencies_injection/firebase_hymn_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all services
  await HiveServices.initialize();
  registerFirebaseHymnDependencies();
  HiveServices.registerHiveHymnDependencies();
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
