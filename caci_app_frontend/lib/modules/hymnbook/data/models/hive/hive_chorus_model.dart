import 'package:hive/hive.dart';

// This file is part of the Hive type adapter generator.
// Run the command `flutter packages pub run build_runner build` to generate the `.g.dart` file.
part 'hive_chorus_model.g.dart';

/// A Hive model class to represent a chorus in the hymnbook.
/// This class is used to store and retrieve chorus data from a Hive database.
@HiveType(typeId: 1) // Unique type ID for this model in Hive.
class HiveChorusModel extends HiveObject {
  /// The number of the chorus (optional).
  @HiveField(0) // Field ID for Hive serialization.
  final int? chorusNumber;

  /// The lines of the chorus as a list of strings (optional).
  @HiveField(1) // Field ID for Hive serialization.
  final List<String>? lines;

  /// Constructor for the HiveChorusModel.
  /// [chorusNumber] is the number of the chorus.
  /// [lines] is the list of strings representing the chorus lines.
  HiveChorusModel({this.chorusNumber, this.lines});
}
