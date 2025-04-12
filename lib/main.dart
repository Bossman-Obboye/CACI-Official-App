import 'package:flutter/material.dart';
// Importing dependencies for handling hymn data from Hive (local database) and Firebase (cloud database)
import 'modules/hymnbook/data/datasources/hive/local/dependencies_injections/hive_hymn_provider.dart';
import 'modules/hymnbook/data/datasources/firebase/dependencies_injection/firebase_hymn_provider.dart';
import 'testing_firbase.dart';

void main() async {
  // Ensures that Flutter bindings are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  print('WidgetsFlutterBinding initialized');   

  // Register all services and dependencies for Firebase and Hive
  registerFirebaseHymnDependencies(); // Sets up Firebase-related dependencies
  print('FirebaseHymnProvider initialized');
  await HiveServices.initialize(); // Initializes Hive (local database)
  print('HiveServices initialized');
  HiveServices.registerHiveHymnDependencies(); // Sets up Hive-related dependencies
  print('HiveHymnProvider initialized');

  // Uploads the first Twi hymn to the database (likely for testing purposes)
  uploadFirstTwiHymn();
  print('First Twi Hymn uploaded');

  // The main app is not currently being run (commented out)
  // runApp(const CACApp());
}

// Main application widget
class CACApp extends StatelessWidget {
  const CACApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sets up the MaterialApp with no debug banner and a home screen of HymnHome
    return MaterialApp(debugShowCheckedModeBanner: false, home: HymnHome());
  }
}

// Placeholder widget for the home screen of the app
class HymnHome extends StatelessWidget {
  const HymnHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Currently, this is a placeholder widget and should be replaced with the actual UI
    return const Placeholder();
  }
}