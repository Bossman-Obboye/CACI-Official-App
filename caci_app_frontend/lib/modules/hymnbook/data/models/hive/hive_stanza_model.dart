import 'package:hive/hive.dart';

part 'hive_stanza_model.g.dart';

/// A Hive model class to represent a stanza in a hymnbook.
/// This class is used to store and retrieve stanza data from a Hive database.
@HiveType(typeId: 0) // Specifies the type ID for this Hive object.
class HiveStanzaModel {
  /// The stanza number (e.g., 1 for the first stanza, 2 for the second, etc.).
  @HiveField(0) // Field index 0 in the Hive database.
  final int stanzaNumber;

  /// The lines of text in the stanza. Each line is represented as a string.
  /// This field is optional and can be null.
  @HiveField(1) // Field index 1 in the Hive database.
  final List<String>? lines;

  /// Constructor for the HiveStanzaModel.
  /// 
  /// [stanzaNumber] is required and represents the stanza's position in the hymn.
  /// [lines] is optional and contains the text lines of the stanza.
  HiveStanzaModel({required this.stanzaNumber, this.lines});
}
