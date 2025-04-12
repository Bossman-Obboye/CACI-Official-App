import 'dart:developer';

import '../../../../../../core/constants/database/hive_box_names.dart';
import 'hive_box_manager.dart';

class HiveBoxInitializer {
   /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  HiveBoxInitializer._privateConstructor();
  // 2. Single static instance created once
  static final _instance = HiveBoxInitializer._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory HiveBoxInitializer() => _instance;

  static Future<void> initializeHiveBox(String langCode) async {
    final String boxName = switch (langCode) {
      HiveBoxNames.hymnsTwi => HiveBoxNames.hymnsTwi,
      HiveBoxNames.hymnsEnglish => HiveBoxNames.hymnsEnglish,
      HiveBoxNames.hymnsYoruba => HiveBoxNames.hymnsYoruba,
      HiveBoxNames.favoriteHymns => HiveBoxNames.favoriteHymns,
      HiveBoxNames.settings => HiveBoxNames.settings,
      _ => HiveBoxNames.genericBox,
    };

    await HiveBoxManager.openBoxIfNeeded(boxName);
  }

  static String handleUnknownLangCode(String langCode) {
    log(
      '[HiveBoxInitializer] Unknown langCode passed: "$langCode". Falling back to generic box.',
      level: 900, // WARNING level
      name: 'HiveBoxInitializer',
    );
    return HiveBoxNames.genericBox;
  }
}
