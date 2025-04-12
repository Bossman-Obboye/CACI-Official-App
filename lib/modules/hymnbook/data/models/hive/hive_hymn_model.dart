import 'package:cac_official/modules/hymnbook/data/models/chorus_model.dart';
import 'package:cac_official/modules/hymnbook/data/models/stanza_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';


part 'hive_hymn_model.g.dart';

// A UUID generator instance for creating unique IDs
const _uuid = Uuid();

/// HiveHymnModel is a data model class for storing hymn information in Hive.
/// It includes fields for hymn metadata, stanzas, and choruses.
@HiveType(typeId: 2) // Specifies the Hive type ID for this model
class HiveHymnModel extends HiveObject {
  @HiveField(0) // Unique identifier for the hymn
  final String id;

  @HiveField(1) // Hymn number
  final int hymnNumber;

  @HiveField(2) // Title of the hymn
  final String title;

  @HiveField(3) // Author of the hymn (optional)
  final String? author;

  @HiveField(4) // Language of the hymn
  final String language;

  @HiveField(5) // Category of the hymn (optional)
  final String? category;

  @HiveField(6) // Tags associated with the hymn
  final List<String> tags;

  @HiveField(7) // List of stanzas in the hymn
  final List<StanzaModel> stanzas;

  @HiveField(8) // List of choruses in the hymn
  final List<ChorusModel> choruses;

  @HiveField(9)
  final bool isFavorite; // Indicates if the hymn is marked as a favorite

  /// Constructor for creating a HiveHymnModel instance.
  /// If no `id` is provided, a unique ID is generated automatically.
  HiveHymnModel({
    String? id, // Optional ID, defaults to a generated UUID
    required this.hymnNumber,
    required this.title,
    this.author,
    required this.language,
    this.category,
    required this.tags,
    required this.stanzas,
    required this.choruses,
    this.isFavorite = false, // Default to false if not provided
  }) : id = id ?? _uuid.v4(); // Assigns a generated UUID if `id` is null

}
