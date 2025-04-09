import '../../../../../core/constants/database/hive_box_names.dart';
import 'hive_box_manager.dart';

class HiveBoxInitializer {
  void initializeHiveForStartupLanguage(String langCode) async {
    String boxName;

    switch (langCode) {
      case HiveBoxNames.hymnsEnglish :
        boxName = HiveBoxNames.hymnsEnglish;
        break;
      case HiveBoxNames.hymnsTwi :
        boxName = HiveBoxNames.hymnsTwi;
        break;
      case HiveBoxNames.hymnsYoruba :
        boxName = HiveBoxNames.hymnsYoruba;
        break;
      case HiveBoxNames.favoriteHymns :
        boxName = HiveBoxNames.favoriteHymns;
        break;
      case HiveBoxNames.settings:
        boxName = HiveBoxNames.settings;
      default:
        boxName = HiveBoxNames.genericBox; // Fallback to a default box name if needed
    }

    await HiveBoxManager.openBoxIfNeeded(boxName);
  }
}
